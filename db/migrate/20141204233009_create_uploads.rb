class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.datetime :uploaded_at, index: true

      t.timestamps
    end
  end
end
