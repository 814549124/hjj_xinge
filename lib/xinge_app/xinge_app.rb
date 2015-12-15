require 'base_request'

class XingeApp
	def initialize(access_id,secret_key)
		@access_id = access_id
		@secret_key = secret_key
	end

	def push_android_by_token(title,content,dev_token)
		params = {
			access_id: @access_id,
			device_token: dev_token,
			message_type: 2,
			message: {
				title: title,
				content: content,
			}.to_json
		}
		BaseRequest.post('push/single_device',params,@secret_key)
	end

	def push_android_by_tags(title,content,tags)
		params = {
			access_id: @access_id,
			tags_list: tags.to_json,
			tags_op: 'OR',
			message_type: 2,
			message: {
				title: title,
				content: content,
			}.to_json
		}
		BaseRequest.post('push/tags_device',params,@secret_key)
	end

	def push_all(title,content)
		params = {
			access_id: @access_id,
			message_type: 2,
			message: {
				title: title,
				content: content,
			}.to_json
		}
		BaseRequest.post('push/all_device',params,@secret_key)
	end

	def push_get_msg_status(task_ids)
		push_ids = []
		task_ids.each do |v|
			push_ids << {push_id: v.to_s}
		end
		params = {
			access_id: @access_id,
			push_ids: push_ids.to_json
		}
		BaseRequest.post('push/get_msg_status',params,@secret_key)
	end



	def application_get_app_device_num
		params = {
			access_id: @access_id
		}
		BaseRequest.post('application/get_app_device_num',params,@secret_key)
	end

	def tags_batch_set(tag_tokens)
		params = {
			access_id: @access_id,
			tag_token_list: tag_tokens.to_json
		}
		BaseRequest.post('tags/batch_set',params,@secret_key)
	end

	def tags_batch_del(tag_tokens)
		params = {
			access_id: @access_id,
			tag_token_list: tag_tokens.to_json
		}
		BaseRequest.post('tags/batch_del',params,@secret_key)
	end

	def tags_query_app_tags(start,limit)
		params = {
			access_id: @access_id,
			start: start.to_i,
			limit: limit.to_i,
		}
		BaseRequest.post('tags/query_app_tags',params,@secret_key)
	end
end