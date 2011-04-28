class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :document_file_name,:document_content_type,:document_file_size, :document_updated_at
      t.string :description
      t.text :comments
      t.date :document_date
      t.timestamps
    end
  end
  
  def self.down
    drop_table :documents
  end
end
