class CreatesTopicTagConnectionToTopics < ActiveRecord::Migration
  def up
    change_table :topic_tags do |t|
      t.belongs_to :topics
    end
  end

  def down
  end
end
