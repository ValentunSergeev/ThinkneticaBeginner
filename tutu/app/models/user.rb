class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable
  has_many :tickets, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
