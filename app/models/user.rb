class User < ApplicationRecord

    validates :name, :email, presence: true
    validates :email, format: { with: /\S+@\S+/ }, uniqueness: { case_sensitive: false }
    validates :contact_number , format: { with: /\(?[0-9]{3}\)?[0-9]{3}[0-9]{4}/,
    message: "only allows numbers" }

    has_one :score , dependent: :destroy

    # def quetions_all
    #     @total_question ||= Question.order('RANDOM()').limit(10)
    # end

end
