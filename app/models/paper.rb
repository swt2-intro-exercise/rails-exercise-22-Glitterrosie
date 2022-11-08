class Paper < ApplicationRecord
    scope :filterByYear, -> (year) { where("year=?", year)  if year.present? }
    has_and_belongs_to_many :authors
    validates :title, :venue, :year, presence: true
    validates :year, numericality: true
    
end
