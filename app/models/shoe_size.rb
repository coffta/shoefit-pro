class ShoeSize < ApplicationRecord
  # テーブルとのアソシエーション
  belongs_to :customer

  with_options presence: true do
    validates :calculated_length,
              :gender,
              :toe_shape_right,
              :toe_shape_left,
              :foot_length_left,
              :foot_length_right,
              :foot_girth_load_left,
              :foot_girth_load_right,
              :foot_girth_nonload_left,
              :foot_girth_nonload_right,
              :foot_width_load_left,
              :foot_width_load_right,
              :foot_width_nonload_left,
              :foot_width_nonload_right,
              :calculated_width_load_right,
              :calculated_width_load_left,
              :calculated_girth_load_right,
              :calculated_girth_load_left,
              :calculated_width_nonload_right,
              :calculated_width_nonload_left,
              :calculated_girth_nonload_right,
              :calculated_girth_nonload_left,
              :foot_measured_date
  end
end
