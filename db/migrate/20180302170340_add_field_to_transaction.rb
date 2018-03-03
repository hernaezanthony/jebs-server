class AddFieldToTransaction < ActiveRecord::Migration[5.0]
  def change
  			add_column :transactions, :item_id, :integer
  	  	  	add_column :transactions, :status, :string
  	  	  	add_column :transactions, :borrowers_name, :string
			add_column :transactions, :borrowers_studentNo, :string
  end
end
