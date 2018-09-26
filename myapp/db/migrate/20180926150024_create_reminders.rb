class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :notify
      t.text :description
      t.integer :cycle_days
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
