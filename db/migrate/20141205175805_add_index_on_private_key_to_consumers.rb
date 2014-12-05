class AddIndexOnPrivateKeyToConsumers < ActiveRecord::Migration
  def change
    add_index :consumers, :private_key
  end
end