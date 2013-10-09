class AddColumnUrlToResources < ActiveRecord::Migration
  def up
    add_column :resources,  :url, :string
  end

  def down
    remove_column :resources,  :url, :string
  end
end
