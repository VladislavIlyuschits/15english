# frozen_string_literal: true

# class about courses
class Course < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
end
