class AddLockableColumnsOnUser < ActiveRecord::Migration[7.0]
	def change
		change_table :users do |t|
			## Lockable
			t.integer  :failed_attempts, default: 0, null: false
			t.string   :unlock_token
			t.datetime :locked_at
		end
		remove_column :users, :confirmation_token, :string
		remove_column :users, :confirmed_at, :datetime
		remove_column :users, :confirmation_sent_at, :datetime
		remove_column :users, :unconfirmed_email, :string
	end
end