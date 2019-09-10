class CreateMessageContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :message_containers do |t|
    	t.references :friendship, foreign_key: true
      t.timestamps
    end
  end
end
