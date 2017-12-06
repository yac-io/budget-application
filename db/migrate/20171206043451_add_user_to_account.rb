class AddUserToAccount < ActiveRecord::Migration[5.1]
  def change
    add_reference :accounts, :user, foreign_key: true, index: true
  end
end
