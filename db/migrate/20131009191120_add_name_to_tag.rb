class AddNameToTag < ActiveRecord::Migration
  def up
    add_column :tags, :name, :string
  end

  def down
    remove_column :tags, :name
  end
end
