class Organisme < ApplicationRecord
  has_many :referent
  has_many :employes
  has_many :organisme_departements
  has_many :departements, -> { distinct } , through: :organisme_departements
  has_many :point_service
  validates_presence_of :name
  validates_presence_of :mail
  validates :mail, :email_format => { :message => ' : Enter a valid email' }
  accepts_nested_attributes_for :employes,
      :allow_destroy => true,
      :reject_if => proc {|attributes|
        attributes.all? {|k,v| v.blank?}}
  accepts_nested_attributes_for :point_service,
            :allow_destroy => true,
            :reject_if => proc {|attributes|
              attributes.all? {|k,v| v.blank?}}

end
