class AddUrlColumnToResources < ActiveRecord::Migration
  def up
    add_column :resources, :url, :string
  end

  def down
    remove_column :resources, :url
  end
end
