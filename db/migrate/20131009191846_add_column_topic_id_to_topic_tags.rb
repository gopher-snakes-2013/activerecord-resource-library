class AddColumnTopicIdToTopicTags < ActiveRecord::Migration
  def up
    add_column :topic_tags, :topic_id, :integer
  end

  def down
    remove_column :topic_tags, :topic_id
  end
end
