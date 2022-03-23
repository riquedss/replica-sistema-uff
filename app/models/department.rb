class Department < ApplicationRecord
    belongs_to :user, optional: true
    has_many :users
    has_many :disciplines, dependent: :destroy
    has_many :college_classes, dependent: :destroy
    
    validates :name, :knowledge_area, :campus, :code, presence: true
    validates :name, :knowledge_area, :campus, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
    validates :name, :campus, length: { maximum: 30 }
    validates :knowledge_area, length: { maximum: 15 }
    validates :code,  uniqueness: true
    validate :user_is_department_coordinator?

    def coordinator
        self.user
    end

    def user_is_department_coordinator?
        user = self.user
        if user.nil?
            return true
        end

        if user.kind != "department_coordinator"
            errors.add(:user, "User is not department coordinator")
        end
    end

    def self.generate_code
        code = "000#{Department.last.id + 1}"
        for _ in 1..(6-code.length)
            code += "0"   
        end
        return code
    end
end
