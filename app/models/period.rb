class Period < ApplicationRecord
    belongs_to :user
    enum  status: { planning: 0, subscription: 1, in_progress: 2, concluded: 3 }

    validates :year, :semester, :status, presence: true
    validates :year, :semester, numericality: { only_integer: true }
    validates :semester, inclusion: { in:[1,2]}

    validate :user_is_director?

    def director
        self.user
    end

    def user_is_director?
        user = self.user
        puts user
        if user.nil?
            return errors.add(:user, "Period can only be created with a director user")
        end

        if user.kind != "director"
            return errors.add(:user, "User is not a director")
        end
    end
    
    

end
