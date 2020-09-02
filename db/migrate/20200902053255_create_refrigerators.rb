class CreateRefrigerators < ActiveRecord::Migration[6.0]
  def change
    create_table :refrigerators do |t|
      t.string :main
      t.string :meat
      t.string :fish
      t.string :egg
      t.string :tofu
      t.string :begetable
      t.string :cooking
      t.timestamps
    end
  end
end
