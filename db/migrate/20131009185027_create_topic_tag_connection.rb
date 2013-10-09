class CreateTopicTagConnection < ActiveRecord::Migration
  def up
    change_table :topic_tags do |t|
      t.belongs_to :tag
    end
  end

  def down
  end
end
