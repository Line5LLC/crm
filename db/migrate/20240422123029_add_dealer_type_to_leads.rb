class AddDealerTypeToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :dealer_type, :integer
    add_column :leads, :company_address, :string, limit: 128

    change_column_null :leads, :first_name, true
    change_column_null :leads, :last_name, true
  end
end