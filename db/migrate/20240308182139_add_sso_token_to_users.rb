class AddSsoTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sso_token, :string
    add_index :users, :sso_token, unique: true
  end
end
