class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories, options: 'DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin' do |t|
      t.string :name, :null => false, index: { unique: true }

      t.timestamps
    end
  end
end
