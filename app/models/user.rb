class User < ActiveRecord::Base
  validates :iden, :email, presence: true
  validates :iden, uniqueness: true, if: 'iden.present?'
end