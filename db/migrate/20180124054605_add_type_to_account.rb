class AddTypeToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :account_type, :string, null: false, default: 'cash'
  end
end
