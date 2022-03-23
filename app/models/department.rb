class Department < ApplicationRecord
    has_many :disciplines, dependent: :destroy
end
