class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
