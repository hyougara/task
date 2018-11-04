class AddStatusToMicropost < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.integer :status,default: 0,null:false,limit: 2

      t.timestamps null: false
    end
    add_index :microposts, :status
  end
end
