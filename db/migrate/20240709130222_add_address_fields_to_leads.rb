class AddAddressFieldsToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :zip_code, :string
    add_column :leads, :unit, :string
    add_column :leads, :city, :string
    add_column :leads, :state, :string
  end
end
