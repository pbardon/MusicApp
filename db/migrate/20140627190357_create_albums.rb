class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name, null: false
      t.integer :band_id, null: false
      t.string :album_cover_url
      t.boolean :live, default: false

      t.timestamps
    end

    add_index :albums, :band_id
    add_index :albums, :live
  end
end
