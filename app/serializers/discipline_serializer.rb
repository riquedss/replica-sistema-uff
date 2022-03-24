class DisciplineSerializer < ActiveModel::Serializer
  attributes :id, :name, :hours, :knowledge_area

  has_many :college_classes 
  has_many :teachers, through: :lectures
    
  #Pre-requisitos da matéria
  has_many :requirements, through: :requisits
  #Matérias que possuem esta matéria como pré-requisito
  has_many :targets, through: :follow_ups
end
