class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :genre
      t.string :author
      t.string :photo_url
      t.integer :price
      t.date :publication_date

      t.timestamps
    end
  end
end
