class Lecture < ApplicationRecord #Relação intermediaria entre professor e disciplina
  belongs_to :user #Professor
  belongs_to :discipline
end
