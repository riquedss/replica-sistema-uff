class User < ApplicationRecord
    has_many :class_enrollments
    has_many :college_classes, through: :class_enrollments
end
