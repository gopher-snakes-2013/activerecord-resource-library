class CreateInitialTables < ActiveRecord::Migration
  def up
    create_table :topics do |t|

      t.timestamps
    end

    create_table :resources do |t|
      t.belongs_to :topic
      t.timestamps
    end

    create_table :topic_tags do |t|

      t.timestamps
    end
    create_table :tags do |t|

      t.timestamps
    end
  end

  def down
    drop_table :topics
    drop_table :topic_tags
    drop_table :tags
    drop_table :resources
  end
end
