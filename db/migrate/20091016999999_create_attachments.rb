class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :attachment_file_name,:attachment_content_type,:attachment_file_size, :attachment_updated_at
      t.string :description
      t.text :comments
      t.date :attachment_date
      t.timestamps
    end
  end
  
  def self.down
    drop_table :attachments
  end
end
