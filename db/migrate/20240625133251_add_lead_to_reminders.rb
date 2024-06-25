class AddLeadToReminders < ActiveRecord::Migration[7.0]
  def change
    add_reference :reminders, :lead, null: false, foreign_key: true
  end
end
