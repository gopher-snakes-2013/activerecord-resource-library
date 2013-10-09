class CreateTopicIdInTopicTags < ActiveRecord::Migration
  def change
    change_table :topic_tags do |t|
      t.belongs_to :topic
    end
  end
end

