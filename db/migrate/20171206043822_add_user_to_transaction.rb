class AddUserToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :user, foreign_key: true, index: true
  end
end
