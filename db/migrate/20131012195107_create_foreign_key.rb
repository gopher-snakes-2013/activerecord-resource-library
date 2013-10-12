class CreateForeignKey < ActiveRecord::Migration
  def change
    change_table :resources do |t|
      t.integer :topic_id
    end
  end
end


