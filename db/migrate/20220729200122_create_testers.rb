class CreateTesters < ActiveRecord::Migration[6.1]
  def change
    create_table :testers do |t|
      t.integer :tester_id, index: {:unique => true}
      t.string :first_name
      t.string :last_name
      t.string :country
      t.datetime :last_login

      t.timestamps
    end
  end
end
