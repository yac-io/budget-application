class AddUserToPaymentMean < ActiveRecord::Migration[5.1]
  def change
    add_reference :payment_means, :user, foreign_key: true, index: true
  end
end
