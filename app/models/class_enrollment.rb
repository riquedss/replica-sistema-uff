class ClassEnrollment < ApplicationRecord
  #Matricula em turma
  #Intermediária entre alunos e turmas
  belongs_to :user
  belongs_to :college_class
end
