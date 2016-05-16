class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :business_id
      t.string :name
      t.string :url
      t.string :image_url
      t.string :phone
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
