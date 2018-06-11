class Company < ApplicationRecord
    has_many :employees  #複数形に注意！
end
