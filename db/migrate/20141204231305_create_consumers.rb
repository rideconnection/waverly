class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :name,        null: false
      t.string :private_key, null: false

      t.timestamps
    end
  end
end
