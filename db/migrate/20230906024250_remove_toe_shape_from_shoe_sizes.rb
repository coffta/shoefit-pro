class RemoveToeShapeFromShoeSizes < ActiveRecord::Migration[7.0]
  def change
    remove_column :shoe_sizes, :toe_shape, :string
  end
end
