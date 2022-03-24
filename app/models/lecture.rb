class Lecture < ApplicationRecord #Relação intermediaria entre professor e disciplina
  belongs_to :teacher, class_name: 'User', foreign_key: 'user_id' #Professor
  belongs_to :discipline
end
