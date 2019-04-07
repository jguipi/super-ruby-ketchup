class Employe < ApplicationRecord
  belongs_to :organisme
  has_many :educations, :dependent => :destroy
  accepts_nested_attributes_for :educations, :allow_destroy => true
  validates_presence_of :nom
  validates_presence_of :prenom
  validates_presence_of :courriel
end
