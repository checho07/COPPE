class EntrepCourse < ApplicationRecord
  belongs_to :course
  belongs_to :entrepreneur
end
