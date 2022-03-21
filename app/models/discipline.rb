class Discipline < ApplicationRecord
    belongs_to :department
    has_many :college_classes, dependent: :destroy #Caso uma matéria seja deletada, todas as suas turmas também serão
end
