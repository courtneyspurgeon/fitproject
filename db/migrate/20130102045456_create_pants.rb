class CreatePants < ActiveRecord::Migration
  def change
    create_table :pants do |t|
      t.string :name
      t.string :style
      t.integer :brand_id

      t.timestamps
    end
  end
end
