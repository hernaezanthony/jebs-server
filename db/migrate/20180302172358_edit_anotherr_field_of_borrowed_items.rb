class EditAnotherrFieldOfBorrowedItems < ActiveRecord::Migration[5.0]
  def change
  			change_column :borrowed_items, :is_returned, :boolean,:default => false
  end
end
