class Document < ApplicationRecord
  belongs_to :project
  belongs_to :file_type
end
