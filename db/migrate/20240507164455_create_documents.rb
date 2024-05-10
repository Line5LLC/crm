class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :file_file_name, null: false
      t.string :file_content_type, null: false
      t.integer :file_file_size
      t.datetime :file_updated_at, null: false
      t.references :documentable, polymorphic: true

      t.timestamps
    end
  end
end
