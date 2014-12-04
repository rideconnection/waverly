class CreateClientAuthorizations < ActiveRecord::Migration
  def change
    create_table :client_authorizations do |t|
      t.string :prime
      t.string :last_name
      t.string :first_name
      t.date :birth_date
      t.string :case_manager
      t.string :case_manager_phone
      t.string :branch
      t.integer :current_authorized
      t.date :current_date_begins
      t.date :current_date_ends
      t.date :current_date_entered
      t.string :current_action
      
      t.datetime :read_at, index: true
      t.references :reader, index: true

      t.timestamps
    end
  end
end
