class CreateDataSources < ActiveRecord::Migration[5.1]
  def change
    create_table :data_sources do |t|
      t.string :name, null: false
      t.string :uid, null: false, index: true
      t.string :external_key, null: false, index: true
      t.text :description
      t.integer :some_field, index: true
      t.integer :some_other_field
      t.decimal :transaction_value
      t.datetime :transaction_time
      t.string :some_string_field
      t.string :some_other_string_field
      t.string :items, array: true
      t.integer :item_ids, array: true
      t.json :meta

      t.timestamps
    end
  end
end
