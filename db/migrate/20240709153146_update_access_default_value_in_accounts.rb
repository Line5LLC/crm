class UpdateAccessDefaultValueInAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :accounts, :access, from: "Public", to: "Private"
  end
end
