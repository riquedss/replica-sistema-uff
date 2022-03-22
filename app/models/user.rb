class User < ApplicationRecord
    belongs_to :course, optional: true
    belongs_to :department, optional: true

    # validates :kind, inclusion: { in: 0..3 }
    # validates :coordinator_type, inclusion: { in: 0..1 }, if: :is_coordinator?
    # validates :name, :nacionality, :state, :rg, :cpf, :email, 
    # :password_digest, :birth_date, :address_number, :street, :district,
    # :cep, :kind, presence: true
    validates :course_id, :registration_number, presence: true, if: :is_student?
    validates :department_id, :registration_number, presence: true, if: :is_professor?
    validates :coordinator_type, :registration_number, presence: true, if: :is_coordinator?
    # validates :cpf, :email, uniqueness: true
    # validates :registration_number, uniqueness: true, if: :has_reg_number?

    enum kind: {
        "student": 0,
        "professor": 1, 
        "coordinator": 2,
        "director": 3
    }

    enum coordinator_type: {
        "department_coordinator": 0,
        "course_coordinator": 1
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
