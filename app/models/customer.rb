class Customer < ApplicationRecord
  # テーブルとのアソシエーション
  belongs_to :user
  has_many :shoe_sizes
  
  with_options presence: true do
    validates :customer_name ,presence: true
    validates :customer_address ,presence: true
    validates :date_of_birth ,presence: true
    validates :customer_phone_number ,presence: true
    validates :customer_email ,presence: true
    validates :occupation ,presence: true
    validates :customer_gender ,presence: true
    validates :prefecture_id ,presence: true
    validates :memo ,presence: true
  end
end
