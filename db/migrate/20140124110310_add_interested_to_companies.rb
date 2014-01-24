class AddInterestedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :not_interested, :boolean
  end
end
