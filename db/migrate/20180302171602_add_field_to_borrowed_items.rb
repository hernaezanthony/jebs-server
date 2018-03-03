class AddFieldToBorrowedItems < ActiveRecord::Migration[5.0]
  def change
  			add_column :borrowed_items, :item_id, :integer
  	  	  	add_column :borrowed_items, :status, :string
  	  	  	add_column :borrowed_items, :borrowers_name, :string
			add_column :borrowed_items, :borrowers_studentNo, :string
  end
end
