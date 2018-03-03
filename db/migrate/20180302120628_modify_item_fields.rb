class ModifyItemFields < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :items, :code, :string
		change_column :items, :available, :boolean,:default => true
		remove_column :items, :quantity

  end
end
