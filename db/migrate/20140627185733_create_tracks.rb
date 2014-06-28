class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string  :track_name, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.boolean :bonus, default: false

      t.timestamps
    end

    add_index :tracks, :album_id
    add_index :tracks, :track_name
  end
end
