class AddCategoryIdToMicroposts < ActiveRecord::Migration[5.2]
  def self.up
    add_column(:microposts, :category_id, :integer)
    add_index(:microposts, :category_id)
  end

  def self.down
    remove_index(:microposts, :column => :category_id)
    remove_column(:microposts, :category_id)
  end
end


