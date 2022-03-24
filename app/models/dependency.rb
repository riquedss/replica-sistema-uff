class Dependency < ApplicationRecord
  belongs_to :requirement, class_name: "Discipline" # Disciplina que é pré-requisito
  belongs_to :target, class_name: "Discipline" # Disciplina que precisa de um pré-requisito
end
