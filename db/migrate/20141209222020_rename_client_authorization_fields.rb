class RenameClientAuthorizationFields < ActiveRecord::Migration
  def change
    rename_column :client_authorizations, :current_date_entered, :current_enter_date
    rename_column :client_authorizations, :birth_date, :dob
  end
end