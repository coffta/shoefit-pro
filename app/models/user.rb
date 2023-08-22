class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :customers

  with_options presence: true do
    validates :nickname
    validates :name
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid. "}
  end
end
