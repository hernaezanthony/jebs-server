class AddFieldToItem < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :items, :name, :string
  	  	add_column :items, :condition, :string
  	  	add_column :items, :quantity, :integer
  	  	add_column :items, :available, :integer
  end
end
