require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.login { Faker::Name.first_name }
Sham.email { Faker::Internet.email }
Sham.tenchar { (("0".."9").to_a+("a".."z").to_a).sample(10).join }

User.blueprint do
  login {Sham.login}
  email {Sham.email}
  crypted_password {"password"}
  password_salt {"password"}
  password { 'funkypass' }
  password_confirmation { 'funkypass' }
  persistence_token {Sham.tenchar}
  single_access_token { Sham.tenchar }
  perishable_token { Sham.tenchar }
end

User.blueprint(:admin) do
  login {"admin"}
  email {"admin@test.org"}
  admin {true}
  editor {true}
end

Attachment.blueprint do
  attachment_file_name {Faker::Name.last_name}
  description {Faker::Lorem.paragraph}  
end
