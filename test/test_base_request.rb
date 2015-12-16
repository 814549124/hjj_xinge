require 'minitest/autorun'

require 'hjj_xinge'

class BaseRequestTest < Minitest::Test
	def test_get
		re = BaseRequest.get('aa',{},5566,'bb')
		assert_equal 404,re['ret_code']

		# 向安卓推送

		re = BaseRequest.get('push/get_msg_status',{
			device_token: '某token',
			push_ids: [{push_id: '1'}].to_json
		},2100163826,'6d460a9b2c394801e167b2c1dc2873f4')
		assert_equal 0,re['ret_code']
	end

	def test_post
		re = BaseRequest.post('aa',{},5566,'bb')
		assert_equal 404,re['ret_code']

		# 向安卓推送

		re = BaseRequest.post('push/get_msg_status',{
			push_ids: [{push_id: '1'}].to_json
		},2100163826,'6d460a9b2c394801e167b2c1dc2873f4')
		assert_equal 0,re['ret_code']
	end
end