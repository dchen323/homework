class FixSessonName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :sesson_token, :session_token
  end
end
