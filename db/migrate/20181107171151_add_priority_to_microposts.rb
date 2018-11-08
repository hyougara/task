class AddPriorityToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :priority, :integer
  end
end
