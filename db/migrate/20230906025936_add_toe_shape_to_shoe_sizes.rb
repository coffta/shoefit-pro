class AddToeShapeToShoeSizes < ActiveRecord::Migration[7.0]
  def change
    add_column :shoe_sizes, :toe_shape_right, :string
    add_column :shoe_sizes, :toe_shape_left, :string
  end
end
