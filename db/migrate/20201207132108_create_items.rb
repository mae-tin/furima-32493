class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text   :text, null: false
      t.integer :caregory_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :days_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.references
      t.timestamps
    end
  end
end
