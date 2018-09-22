class Advisory < ApplicationRecord
  belongs_to :adviser
  belongs_to :project
end
