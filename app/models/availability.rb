class Availability < ApplicationRecord
  #Classe que controla a relação de disponibilidade de uma turma para um curso
  belongs_to :course
  belongs_to :college_class
end
