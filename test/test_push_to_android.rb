require 'minitest/autorun'

require 'xinge_app/xinge_app'

class XingeAppTest < Minitest::Test
	def test_base
		assert XingeApp.new 2100163826,'6d460a9b2c394801e167b2c1dc2873f4'
	end
	def test_push_to_android
		xinge_app = XingeApp.new 2100163826,'6d460a9b2c394801e167b2c1dc2873f4'
		re = xinge_app.push_android_by_token('title','content','某token')
		assert 40,re['ret_code']
	end
end