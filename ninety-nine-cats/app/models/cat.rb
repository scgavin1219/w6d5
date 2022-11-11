class Cat < ApplicationRecord
    require 'action_view'
    include ActionView::Helpers::DateHelper

    CAT_COLORS = %w(red orange yellow green blue purple tortoise)

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS, message: "invalid color"}
    validates :sex, inclusion: {in: %w(M F)}
    validate :birth_date_cannot_be_in_the_future

    def birth_date_cannot_be_in_the_future
        if birth_date.present? && birth_date > Date.today #no nil error
            errors.add(:birth_date, "can't be in the future!!!!!!L:JDJFKLDSFDKFJKDLFSJ")
        end
    end

    def age
        Date.today.year - birth_date.year
    end







end
