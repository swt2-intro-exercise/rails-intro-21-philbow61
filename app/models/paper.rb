class Paper < ApplicationRecord
    
    validates :title, presence: true, length: {minimum: 1} 
    validates :venue, presence: true, length: {minimum: 1} 
    validates :year, presence: true, numericality: true, length: {minimum: 1}

    scope :published, -> (year_in) {where("year = ?", year_in)}
    
    has_and_belongs_to_many :authors

end
