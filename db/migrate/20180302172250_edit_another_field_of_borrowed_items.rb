class EditAnotherFieldOfBorrowedItems < ActiveRecord::Migration[5.0]
  def change
  	  	rename_column :borrowed_items, :status, :is_returned
  end
end
