class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders, options: 'DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin' do |t|
      t.string :notify, :null => false
      t.text :description, :null => false
      t.integer :cycle_days, :null => false
      t.references :category, :null => false, foreign_key: true

      t.timestamps
    end
  end
end
