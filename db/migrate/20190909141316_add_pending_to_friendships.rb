class AddPendingToFriendships < ActiveRecord::Migration[5.2]
  def change
  	add_column :friendships, :pending, :boolean
  end
end
