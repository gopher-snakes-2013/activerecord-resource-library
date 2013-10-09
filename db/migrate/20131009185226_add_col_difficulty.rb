class AddColDifficulty < ActiveRecord::Migration
  def up
    add_column :resources, :difficulty, :symbol
  end

  def down
    add_column :resources, :difficulty
  end
end
