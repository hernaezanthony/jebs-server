class AddMoreFieldToBorrowedItems < ActiveRecord::Migration[5.0]
  def change
  	  	  	add_column :borrowed_items, :borrowers_course, :string
  	  	  	add_column :borrowed_items, :borrowers_year_and_level, :string

  end
end
