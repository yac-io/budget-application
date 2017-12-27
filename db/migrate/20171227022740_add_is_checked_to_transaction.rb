class AddIsCheckedToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :checked, :boolean, default: false
  end
end
