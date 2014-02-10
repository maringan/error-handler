class User < ActiveRecord::Base
  validates :email, presence: true
  validates :iden, uniqueness: true, if: 'iden.present?'
  validates :email, uniqueness: true, format: { with: /\A[^@]+@[^@]+\z/ }, if: 'email.present?'
end