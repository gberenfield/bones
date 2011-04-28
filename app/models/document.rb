class Document < ActiveRecord::Base
  has_attached_file :document, :styles => {
    :thumb=> ["32x32#", :png],
    :small  => ["150x150>",:png] }
end
