class DestroyUserLessonsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_lessons
  end
end
