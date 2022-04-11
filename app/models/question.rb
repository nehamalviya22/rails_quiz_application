class Question < ApplicationRecord
    has_many :answers
    has_many :options
    accepts_nested_attributes_for :options
    accepts_nested_attributes_for :answers
end
