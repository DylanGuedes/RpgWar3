class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :price
      t.string :name
      t.float :damage
      t.float :defense
      t.string :restriction
      t.belongs_to :player

      t.timestamps null: false
    end
  end
end
