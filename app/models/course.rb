class Course < ApplicationRecord
    belongs_to :coordinator, class_name: "User", foreign_key: "user_id"
    has_many :availabilities, dependent: :destroy
    has_many :college_classes, through: :availabilities
end
