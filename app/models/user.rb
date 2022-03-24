class User < ApplicationRecord
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

    has_secure_password

    # validates :kind, inclusion: { in: 0..5 }
    # validates :name, :nacionality, :state, :rg, :cpf, :email, 
    # :password_digest, :birth_date, :address_number, :street, :district,
    # :cep, :kind, presence: true
    validates :course_id, :registration_number, presence: true, if: :is_student?
    validates :department_id, :registration_number, presence: true, if: :is_professor?
    validates :registration_number, presence: true, if: :is_coordinator?
    # validates :cpf, :email, uniqueness: true
    # validates :registration_number, uniqueness: true, if: :has_reg_number?

    enum kind: {
        "student": 0,
        "professor": 1, 
        "department_coordinator": 2,
        "course_coordinator": 3,
        "director": 4,
        "admin": 5
    }

    def is_student?
        self.kind == "student"
    end

    def is_professor?
        self.kind == "professor"
    end

    def has_reg_number?
        is_student? or is_professor? or is_coordinator?
    end

    def is_coordinator?
        self.kind == "coordinator"
    end

    

end
