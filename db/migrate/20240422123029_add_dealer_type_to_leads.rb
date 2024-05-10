class AddDealerTypeToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :dealer_type, :integer
  end
end
