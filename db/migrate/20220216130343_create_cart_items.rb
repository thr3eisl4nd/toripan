class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :item, index: true, null: false, foreign_key: true
      t.references :cart, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end