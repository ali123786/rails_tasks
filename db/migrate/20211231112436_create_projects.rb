class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.belongs_to :user
      t.string :title

      t.timestamps
    end
  end
end
