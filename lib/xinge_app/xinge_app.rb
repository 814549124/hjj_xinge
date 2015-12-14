require 'base_request'

class XingeApp
	def initialize(access_id,secret_key)
		@access_id = access_id
		@secret_key = secret_key
	end

	def push_android_by_token(title,content,dev_token)
		params = android_params(title,content,dev_token)
		puts params
		BaseRequest.post('push/single_device',params,@secret_key)
	end

	private
	def android_params(title,content,dev_token)
		params = {
			access_id: @access_id,
			device_token: dev_token,
			message_type: 1,
			message: {
				title: title,
				content: content,
				builder_id: 0,
			}.to_json
# 			message: '{
# "title ":"xxx",
# "content ":"xxxxxxxxx", 
# "accept_time": 
# [ {
# “start”:{“hour”:”13”,“min”:”00”},
# ”end”: {“hour”:”14”,“min”:”00”} },
# {
# “start”:{“hour”:”00”,”min”:”00”},
# ”end”: {“hour”:”09”,“min”:”00”} }
# ],
# "n_id":0,  "builder_id":0, 
# "ring":1, 
# "ring_raw":"ring", 
# "vibrate":1, 
# "lights":1
# "clearable":1, 
# "icon_type":0 
# "icon_res":"xg",
# "action":{ 
# "action_type ": 1, 
#        "activity ": "xxx"
# "aty_attr ":  {
# "if":0, 
# Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED);
# "pf":0, 
# }
# "browser": {"url": "xxxx ","confirm": 1},
#        “intent”: “xxx”
#      },
# "custom_content":{
#        "key1": "value1",
#        "key2": "value2"
#      }
# }'
		}
	end
end