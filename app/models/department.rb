class Department < ApplicationRecord
    belongs_to :department_coordinator, optional: true
    has_many :users
    has_many :disciplines, dependent: :destroy
    has_many :college_classes, dependent: :destroy
    
    validates :name, :knowledge_area, :campus, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validate :user_is_department_coordinator

    def coordinator
        self.user
    end

    def user_is_department_coordinator
        user = self.user.role
        if user != :department_coordinator and user != nil
            errors.add(:department_coordinator, "User is not department coordinator")
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
