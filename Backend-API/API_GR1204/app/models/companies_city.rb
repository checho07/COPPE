class CompaniesCity < ApplicationRecord
  belongs_to :company
  belongs_to :city
end
