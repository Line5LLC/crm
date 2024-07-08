class AddColumnsToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :document_type, :string
    add_column :documents, :document_name, :string
  end
end
