class CreateTesters < ActiveRecord::Migration[6.1]
  def change
    create_table :testers do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.datetime :last_login

      t.timestamps
    end
  end
end
