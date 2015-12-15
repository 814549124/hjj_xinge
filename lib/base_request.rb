require 'digest/md5'
require 'net/http'
require 'json'


class BaseRequest
	@@host = 'openapi.xg.qq.com'
	@@version = 'v2'
	@@http = 'http'
	@@base_url = "#{@@http}://#{@@host}/#{@@version}"

	##
	# 返回rest 返回值
	# 示例:
	# ```ruby
	#   require 'xinge_app/xinge_app'
	# 	xinge_app = XingeApp.new access_id,secret_key
	# 	re = xinge_app.push_android_by_token('title','content','某token')
	# ``` 
	# >> {'ret_code'=>0} ...
	#
	#
	def self.get(url_path,params,secret_key)
		url_str = "#{@@base_url}/#{url_path}"
		params = self.handle_params(:GET,url_path,params,secret_key)
		uri = URI(url_str)
		uri.query = URI.encode_www_form(params)
		res = Net::HTTP.get_response(uri)
		if res.is_a?(Net::HTTPSuccess)
			JSON.parse res.body
		else
			{
				'ret_code'=> res.code.to_i,
				'err_msg'=> res.message
			}
		end
	end

	def self.post(url_path,params,secret_key)
		url_str = "#{@@base_url}/#{url_path}"
		params = self.handle_params(:POST,url_path,params,secret_key)

		uri = URI(url_str)
		res = Net::HTTP.post_form(uri,params)

		if res.is_a?(Net::HTTPSuccess)
			JSON.parse res.body
		else
			{
				'ret_code'=> res.code.to_i,
				'err_msg'=> res.message
			}
		end
	end

	private
	def self.handle_params(method,url_path,params,secret_key)
		params[:timestamp] = Time.now.to_i
		parasm_str = ''
		cloned_params = params.sort_by {|k,v|k}
		cloned_params.each do |k,v|
			parasm_str += "#{k}=#{v}"
		end
		params[:sign]= Digest::MD5.hexdigest("#{method}#{@@host}/#{@@version}/#{url_path}#{parasm_str}#{secret_key}")
		params
	end
end
