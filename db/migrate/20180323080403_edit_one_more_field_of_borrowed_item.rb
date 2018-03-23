class EditOneMoreFieldOfBorrowedItem < ActiveRecord::Migration[5.0]
  def change
  	  	  	rename_column :borrowed_items, :borrowers_year_and_level, :borrowers_year_and_section
  end
end
