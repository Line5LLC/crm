class AddLeadReferenceToComments < ActiveRecord::Migration[7.0]
  def change
    change_table :comments do |t|
      t.references :lead, foreign_key: true unless t.column_exists?(:lead_id)
    end
  end
end
