class CollegeClass < ApplicationRecord #Turma
    belongs_to :discipline
    belongs_to :department
    belongs_to :teacher, class_name: 'User', foreign_key: 'user_id'
    has_many :class_enrollments
    has_many :users, through: :class_enrollments
end
