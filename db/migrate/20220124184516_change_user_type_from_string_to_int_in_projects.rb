class ChangeUserTypeFromStringToIntInProjects < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :user_type,'integer USING CAST(user_type AS integer)'

  end
  def down
    change_column :users, :user_type, 'string USING CAST(user_type AS string)'
  end
end
