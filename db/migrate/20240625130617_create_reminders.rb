class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.date :date
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
