# CreateProducts
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.timestamps null: false
      t.belongs_to :channel, index: true, foreign_key: true
      t.string :title
      t.string :image
      t.monetize :price
      t.string :link
    end
  end
end
