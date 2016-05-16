class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :item_id
      t.string :type
      t.string :name
      t.string :url
      t.string :image_url

      t.timestamps null: false
    end
  end
end
