class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.references :user,                  null: false, foreign_key: true
      t.string     :customer_name,         null: false 
      t.string     :customer_address        
      t.date       :date_of_birth      
      t.string     :customer_phone_number        
      t.string     :customer_email       
      t.string     :occupation   
      t.string     :customer_gender      
      t.text       :memo   

      t.timestamps
    end
  end
end
