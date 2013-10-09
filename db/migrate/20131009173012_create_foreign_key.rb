class CreateForeignKey < ActiveRecord::Migration
  def up
    change_table :resources do |t|
      t.integer :topic_id
    end
  end

  def down
  end
end
