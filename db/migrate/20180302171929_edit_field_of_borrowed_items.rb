class EditFieldOfBorrowedItems < ActiveRecord::Migration[5.0]
  def change
  	rename_column :borrowed_items, :borrowers_studentNo, :borrowers_student_number
  end
end
