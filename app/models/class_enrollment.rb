class ClassEnrollment < ApplicationRecord
  #Matricula em turma
  belongs_to :user
  belongs_to :college_class
end
