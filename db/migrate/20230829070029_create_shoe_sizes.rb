class CreateShoeSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_sizes do |t|
      t.references :customer, null: false , foreign_key: true
      t.integer    :calculated_length, null: false
      t.string     :gender  , null: false      
      t.string     :toe_shape  , null: false    
      t.integer    :foot_length_left     , null: false   
      t.integer    :foot_length_right , null: false      
      t.integer    :foot_girth_load_left , null: false  
      t.integer    :foot_girth_load_right , null: false     
      t.integer    :foot_girth_nonload_left, null: false
      t.integer    :foot_girth_nonload_right, null: false   
      t.integer    :foot_width_load_left, null: false   
      t.integer    :foot_width_load_right, null: false   
      t.integer    :foot_width_nonload_left, null: false   
      t.integer    :foot_width_nonload_right, null: false   
      t.string     :calculated_width_load_right, null: false   
      t.string     :calculated_width_load_left , null: false  
      t.string     :calculated_girth_load_right, null: false   
      t.string     :calculated_girth_load_left, null: false   
      t.string     :calculated_width_nonload_right, null: false   
      t.string     :calculated_width_nonload_left, null: false   
      t.string     :calculated_girth_nonload_right, null: false   
      t.string     :calculated_girth_nonload_left, null: false   
      t.date       :foot_measured_date, null: false      

      t.timestamps
    end
  end
end
