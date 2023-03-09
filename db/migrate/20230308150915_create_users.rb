class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date_of_birth
      t.boolean :gender
      t.string :pasword_digest

      t.timestamps
    end
  end
end
