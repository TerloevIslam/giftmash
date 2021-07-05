class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :img_url
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
