class Period < ApplicationRecord
    enum  status: { planning: 0, subscription: 1, in_progress: 2, concluded: 3 }

    validates :year, :semester, :status, presence: true
    validates :year, :semester, numericality: { only_integer: true }
    validates :semester, inclusion: { in:[1,2] }
end