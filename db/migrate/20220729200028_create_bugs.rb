class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.integer :bug_id, index: {:unique => true }
      t.references :testers, null: false, foreign_key: true
      t.references :devices, null: false, foreign_key: true

      t.timestamps
    end
  end
end
