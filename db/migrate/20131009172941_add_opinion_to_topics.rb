class AddOpinionToTopics < ActiveRecord::Migration
  def up
    add_column :topics, :opinion, :string
  end

  def down
    remove_column :topics, :opinion
  end
end
