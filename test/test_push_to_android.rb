require 'minitest/autorun'

require 'xinge_app/xinge_app'

class PushToAndroidTest < Minitest::Test
	def test_base
		assert XingeApp.new 2100163826,'6d460a9b2c394801e167b2c1dc2873f4'
	end

	def test_push_to_android
		xinge_app = XingeApp.new 2100163826,'6d460a9b2c394801e167b2c1dc2873f4'
		re = xinge_app.push_android_by_token('title','content','4455654')
		assert_equal 40,re['ret_code']

		re = xinge_app.push_android_by_tags('title','content',['1','2'])
		assert_equal 0,re['ret_code']

		re = xinge_app.push_all('title','content')
		assert_equal 0,re['ret_code']

		re = xinge_app.push_get_msg_status([re['result']['push_id']])
		assert_equal 0,re['ret_code']
		assert_equal 0,re['result']['list'][0]['total']

		re = xinge_app.application_get_app_device_num
		assert_equal 0,re['ret_code']


		tag_tokens = [['tag1','456']]
		re = xinge_app.tags_batch_set(tag_tokens)
		assert_equal 0,re['ret_code']

		re = xinge_app.tags_query_app_tags(0,10)
		assert_equal 0,re['ret_code']
		assert_equal 1,re['result']['total']

		re = xinge_app.tags_batch_del(tag_tokens)
		assert_equal 0,re['ret_code']

		

	end
end