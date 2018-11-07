class AddCreateOnToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :create_on, :date
  end
end
