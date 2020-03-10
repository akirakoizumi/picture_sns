class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :website
      t.text :bio
      t.string :email
      t.string :phone_number
      t.string :gender
      t.string :password_digest

      t.timestamps
    end
  end
end
