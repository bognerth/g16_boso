class Department < ActiveRecord::Base
  attr_accessible :title

  has_many :companies
end
