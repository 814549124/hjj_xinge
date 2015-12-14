require 'base_request'

class XingeApp
	def initialize(access_id,secret_key)
		@access_id = access_id
		@secret_key = secret_key
	end

	def push_android_by_token(title,content,dev_token)
		params = android_params(title,content,dev_token)
		BaseRequest.post('push/single_device',params,@secret_key)
	end

	private
	def android_params(title,content,dev_token)
		params = {
			access_id: @access_id,
			dev_token: dev_token,
			message_type: 1,
			message: {
				title: title,
				content: content,
				builder_id: 0,
			}.to_json
		}
	end
end