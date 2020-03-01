class CreateDiscount < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :desired_quantity
      t.integer :percentage
      t.references :item, foreign_key: true
    end
  end
end
