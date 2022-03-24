class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nacionality, :state, :rg, :cpf, :email, :birth_date, :address_number, :street, :district, :address_complement, :cep, :phone, :registration_number, :kind

  belongs_to :course, optional: true
  belongs_to :department, optional: true
  has_many :college_classes
  has_one :course
  has_one :department
  has_many :periods
  has_many :lectures
  has_many :class_enrollments
  has_many :grades
  has_many :students, class_name: "User", through: :grades
  has_many :professors, class_name: "User", through: :grades

end
