class AddColumnDifficulty < ActiveRecord::Migration
  def up
  	add_column :resources, :difficulty, :string
  end

  def down
  	remove_column :resources, :difficulty
  end
end
