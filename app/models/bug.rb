class Bug < ApplicationRecord
  belongs_to :tester
  belongs_to :device
end
