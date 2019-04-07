class Telephone < ApplicationRecord
  belongs_to :referent, required: false
  validates_format_of :number,
                      :with => /\d[0-9]\)*\z/,
                      :on => :create,
                      :message => "Le numéro de téléphone doit être valide (des chifrres et des tirets)"
end
