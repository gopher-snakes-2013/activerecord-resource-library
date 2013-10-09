class CreateInitialTables < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :name
      t.string :opinion


      t.timestamps
    end

    create_table :resources do |t|
      t.belongs_to :topic
      t.string :url
      t.string :difficulty


      t.timestamps
    end

    create_join_table :tags, :topics, table_name: :topic_tags do |t|
      t.index  :tag_id
      t.index  :topic_id

      t.timestamps
    end
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end


  end

  def down
    drop_table :topics
    drop_table :tags_topics
    drop_table :tags
    drop_table :resources
  end
end
