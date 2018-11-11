class AddUserIdToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :user_id, :integer
    end

    add_index :microposts , [:user_id, :created_at]
  end
end
