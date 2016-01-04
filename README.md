
# ruby版腾讯信鸽推送
用法
-----
```ruby
require 'xinge_app/xinge_app'
xinge_app = XingeApp.new access_id,secret_key
#推送给单一设备,根据表单token
re = xinge_app.push_android_by_token(title,content,device_token)
```

>其余参考test用例
