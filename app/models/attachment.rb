class Attachment < ActiveRecord::Base
  include Paperclip  # workaround for Rails 3 beta 3... 
  has_attached_file :attachment
end
