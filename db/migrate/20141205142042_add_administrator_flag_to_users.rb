class AddAdministratorFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :administrator, :boolean, index: true
    add_column :users, :name, :string
  end
end
