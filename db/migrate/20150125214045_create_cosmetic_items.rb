class CreateCosmeticItems < ActiveRecord::Migration
  def change
    create_table :cosmetic_items do |t|
      t.integer :price
      t.string :name
      t.float :damage
      t.float :defense
      t.string :restriction

      t.timestamps null: false
    end
  end
end
