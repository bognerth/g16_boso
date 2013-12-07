class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :street
      t.string :plz
      t.string :city
      t.string :phone
      t.string :fax
      t.string :email
      t.integer :department_id
      t.string :appellation
      t.string :firstname
      t.string :lastname
      t.string :personal_phone
      t.string :personal_fax
      t.string :personal_email
      t.string :position
      t.boolean :interested
      t.boolean :informed
      t.boolean :cooperating
      t.boolean :educates
      t.integer :places
      t.integer :azubis
      t.text :comment

      t.timestamps
    end
  end
end
