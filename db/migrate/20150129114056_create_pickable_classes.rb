class CreatePickableClasses < ActiveRecord::Migration
  def change
    create_table :pickable_classes do |t|
      t.string :name
      t.string :description, :default => ""

      t.timestamps null: false
    end
  end
end
