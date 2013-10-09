class AddTopicIdToResources < ActiveRecord::Migration
  def up
    add_column :resources, :topic_id, :integer
   end

  def down
    remove_column :resources, :topic_id
  end
end
