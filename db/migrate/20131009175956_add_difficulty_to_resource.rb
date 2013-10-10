class AddDifficultyToResource < ActiveRecord::Migration
  def up
  	add_column :resources, :difficulty, :text
  end

  def down
  	remove_column :resources, :difficulty
  end
end
