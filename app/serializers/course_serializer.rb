class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :knowledge_area, :code, :campus

  belongs_to :coordinator, class_name: "User"
  has_many :students, class_name: 'User'
  has_many :college_classes, through: :availabilities
end
