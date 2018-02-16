class Contact < ApplicationRecord
  validates_presence_of :firstname
  validates_presence_of :lastname
  #validates :picture, uniqueness: true, if: 'picture.present?'
  validates_uniqueness_of :firstname, scope: %i[lastname]
end
