class CreateForeignKeysTopicTags < ActiveRecord::Migration
  def change
    change_table :topic_tags do |t|
      t.integer :topic_id
      t.integer :tag_id
    end
  end
end


