class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :options, dependent: :destroy
    accepts_nested_attributes_for :options
    accepts_nested_attributes_for :answers

    validates :description, :maxtime, presence: true
    validates :description, uniqueness: true
end
