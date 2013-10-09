class AddColumnNameToTopics < ActiveRecord::Migration
  def up
    add_column :topics, :name, :string
  end

  def down
    remove_column :topics, :name
  end
end
