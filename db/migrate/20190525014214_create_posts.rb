class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :when
      t.string :tenki
      t.string :date
      t.integer :max
      t.integer :min
      t.text :image_url

      t.timestamps
    end
  end
end
