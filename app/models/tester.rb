class Tester < ApplicationRecord
  has_many :testers_devices, foreign_key: :testers_id, class_name: 'TestersDevice'
  has_many :devices, through: :testers_devices, source: :device
  has_many :bugs
end
