class AddExtToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :ext, :string
  end
end
