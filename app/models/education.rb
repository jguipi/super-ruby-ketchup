class Education < ApplicationRecord
  belongs_to :employe, optional: true
  validates_presence_of :name
  validates_presence_of :type_education
end
