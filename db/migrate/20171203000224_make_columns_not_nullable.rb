class MakeColumnsNotNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :name, :string, null: false
    change_column :accounts, :currency, :string, null: false
    change_column :categories, :name, :string, null: false
    change_column :payment_means, :name, :string, null: false
    change_column :payment_means, :currency, :string, null: false
  end
end
