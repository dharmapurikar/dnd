class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :phone_number
      t.boolean :cat_1
      t.boolean :cat_2
      t.boolean :cat_3
      t.boolean :cat_4
      t.boolean :cat_5
      t.boolean :cat_6
      t.boolean :cat_7
      t.boolean :all

      t.timestamps null: false
    end
  end
end
