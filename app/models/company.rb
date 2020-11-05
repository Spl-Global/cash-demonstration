class Company < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :cash_transactions
end
