require 'machinist/active_record'
require 'forgery'

Sham.login  { Forgery::Internet.user_name }
Sham.email  { Forgery::Internet.email_address }
Sham.tenchar { (("0".."9").to_a+("a".."z").to_a).sample(10).join }

User.blueprint do
  login {Sham.login}
  email {Sham.email}
  password { 'funkypass' }
  password_confirmation { 'funkypass' }
end

User.blueprint(:admin) do
  login {"admin"}
  email {"admin@test.org"}
  admin {true}
  editor {true}
end

Attachment.blueprint do
  attachment_file_name { Forgery::Basic.text }
  description { Forgery::LoremIpsum.text }  
end
