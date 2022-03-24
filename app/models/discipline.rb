class Discipline < ApplicationRecord
    belongs_to :department

    has_many :lectures, dependent: :destroy
    has_many :college_classes, dependent: :destroy 
    has_many :teachers, through: :lectures #Caso uma matéria seja deletada, todas as suas turmas também serão
    
    #Pre-requisitos da matéria
    has_many :requisits, class_name: "Dependency", foreign_key: :target_id, dependent: :destroy
    has_many :requirements, through: :requisits
    #Matérias que possuem esta matéria como pré-requisito
    has_many :follow_ups, class_name: "Dependency", foreign_key: :requirement_id, dependent: :destroy
    has_many :targets, through: :follow_ups
end
