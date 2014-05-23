class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
    add_index :albums, :user_id
  end
end
