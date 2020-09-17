class AddUrlToRefrigerators < ActiveRecord::Migration[6.0]
  def change
    add_column :refrigerators, :url, :string
  end
end
