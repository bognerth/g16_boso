class Company < ActiveRecord::Base
  attr_accessible :position, :appellation, :azubis, :city, :comment, :cooperating, :department_id, :educates, :email, :fax, :firstname, :informed, :interested, :lastname, :personal_email, :personal_fax, :personal_phone, :phone, :places, :plz, :street, :title

  belongs_to :department

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product = find_by_id(row["id"]) || new
      #raise row.to_hash.slice(*accessible_attributes).to_yaml
      product.attributes = row.to_hash.slice(*accessible_attributes)

      product.save!
    end
  end
  
  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     company = find_by_id(row["id"]) || new
  #     company.attributes = row.to_hash.slice(*accessible_attributes)
  #     company.save!
  #   end
  # end

  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
  #   when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
  #   when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
end
