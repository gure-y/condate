class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :title, null: false
      t.string :url
      t.text :recipe
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
