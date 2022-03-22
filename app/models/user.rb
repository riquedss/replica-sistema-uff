class User < ApplicationRecord
    belongs_to :course, optional: true
    belongs_to :department, optional: true

    has_secure_password

    # validates :kind, inclusion: { in: 0..4 }
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
        "director": 4
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
