class Course < ApplicationRecord
  belongs_to :course_type
  belongs_to :area
end
