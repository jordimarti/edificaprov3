class Organization < ApplicationRecord
  has_many :affiliations
  has_many :users, through: :affiliations
end
