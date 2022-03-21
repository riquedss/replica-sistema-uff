class Discipline < ApplicationRecord
    belongs_to :department

    has_many :lectures, dependent: :destroy
    has_many :college_classes, dependent: :destroy 
    has_many :users, through: :lectures#Caso uma matéria seja deletada, todas as suas turmas também serão
end
