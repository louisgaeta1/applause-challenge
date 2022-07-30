class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.integer :device_id, index: {:unique => true}
      t.string :description

      t.timestamps
    end
  end
end
