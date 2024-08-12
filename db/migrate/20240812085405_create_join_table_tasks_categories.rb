class CreateJoinTableTasksCategories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tasks, :categories do |t|
      t.index :task_id
      t.index :category_id
      # Add any additional indexes or constraints if needed
    end
  end
end