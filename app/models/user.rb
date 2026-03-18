class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :transactions
  has_many :accounts
  has_many :categories
  has_many :payment_means
  has_many :investments

  # Rails 8 passes a single argument to serialize_from_session; Devise 4 expects two.
  # This shim keeps compatibility by accepting 1 or 2 args and delegating to Devise.
  def self.serialize_from_session(data, salt = nil)
    super(data, salt)
  end
end
