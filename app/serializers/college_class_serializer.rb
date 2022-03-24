class CollegeClassSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :calendar, :room, :spots

  belongs_to :teacher
  has_many :users, through: :class_enrollments
end
