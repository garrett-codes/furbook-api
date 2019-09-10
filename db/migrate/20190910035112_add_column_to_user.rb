class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :bio, :string
  	add_column :users, :animal, :string
  	add_column :users, :breed, :string
  	add_column :users, :birth_date, :datetime
  	add_column :users, :lives_in, :string
  	add_column :users, :from, :string
  	add_column :users, :family, :string
  	add_column :users, :favorite_hobbies, :string
  end
end
