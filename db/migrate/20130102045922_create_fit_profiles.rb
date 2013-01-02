class CreateFitProfiles < ActiveRecord::Migration
  def change
    create_table :fit_profiles do |t|
      t.integer :hip_fit
      t.integer :waist_fit
      t.integer :thigh_fit
      t.integer :pant_id

      t.timestamps
    end
  end
end
