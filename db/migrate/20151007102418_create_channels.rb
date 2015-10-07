class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.timestamps null: false
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :url
    end
  end
end
