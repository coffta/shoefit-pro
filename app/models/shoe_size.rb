class ShoeSize < ApplicationRecord
  # テーブルとのアソシエーション
  belongs_to :customer

  with_options presence: true do
    validates :calculated_length ,presence: true
    validates :gender ,presence: true
    validates :toe_shape ,presence: true
    validates :foot_length_left ,presence: true
    validates :foot_length_right ,presence: true
    validates :foot_girth_load_left ,presence: true
    validates :foot_girth_load_right ,presence: true
    validates :foot_girth_nonload_left ,presence: true
    validates :foot_girth_nonload_right ,presence: true
    validates :foot_width_load_left ,presence: true
    validates :foot_width_load_right ,presence: true
    validates :foot_width_nonload_left ,presence: true
    validates :foot_width_nonload_right ,presence: true
    validates :calculated_width_load_right ,presence: true
    validates :calculated_width_load_left ,presence: true
    validates :calculated_girth_load_right ,presence: true
    validates :calculated_girth_load_left ,presence: true
    validates :calculated_width_nonload_right ,presence: true
    validates :calculated_width_nonload_left ,presence: true
    validates :calculated_girth_nonload_right ,presence: true
    validates :calculated_girth_nonload_left ,presence: true
    validates :foot_measured_date ,presence: true
  end
end
