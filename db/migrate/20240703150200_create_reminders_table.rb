class CreateRemindersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders_tables do |t|
      t.references :lead, foreign_key: true
      t.date :date
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
