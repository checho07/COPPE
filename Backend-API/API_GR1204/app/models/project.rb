class Project < ApplicationRecord
  belongs_to :entrepreneur
  belongs_to :tutor
  belongs_to :area
end
