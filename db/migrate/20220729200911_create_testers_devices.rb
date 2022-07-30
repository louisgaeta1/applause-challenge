class CreateTestersDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :testers_devices do |t|
      t.references :testers, null: false, foreign_key: true
      t.references :devices, null: false, foreign_key: true

      t.timestamps
    end
  end
end
