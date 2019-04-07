class Referent < ApplicationRecord
  validates_presence_of :nom
  validates_presence_of :prenom
  validates_presence_of :courriel

  validates :courriel, :email_format => { :message => ' : Enter a valid email' }, uniqueness: true
  has_many :telephones, dependent: :destroy
  belongs_to :organisme, optional: true
  accepts_nested_attributes_for :telephones,
      :allow_destroy => true,
      :reject_if => proc {|attributes|
        attributes.all? {|k,v| v.blank?}}


end
