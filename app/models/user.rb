# frozen_string_literal: true

# :User Model:
class User < ApplicationRecord
  # Roles
  rolify
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  # Validations
  validates_uniqueness_of :email

  # Associations
  has_many :companies


  attr_accessor :role
end
