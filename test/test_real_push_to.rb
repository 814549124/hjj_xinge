require 'minitest/autorun'

require 'xinge_app/xinge_app'

class RealPushTo < Minitest::Test

	def test_push_to_android
		xinge_app = XingeApp.new 2100171176,'cf272add39293d46d48fac731130fc0c'

		re = xinge_app.push_android_by_token('title','content','21cffcd4aa876964413f8eb18a328956f197f819')
		assert_equal 0,re['ret_code']
	end
end