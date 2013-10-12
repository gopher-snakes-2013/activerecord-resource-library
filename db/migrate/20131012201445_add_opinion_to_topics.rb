class AddOpinionToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :opinion, :string
  end
end
