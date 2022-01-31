class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :project
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :user_type

      t.timestamps
    end
  end
end
