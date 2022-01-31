class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.belongs_to :project, index: true
      t.string :descriptive_title
      t.date :deadline
      t.string :screenshot
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
