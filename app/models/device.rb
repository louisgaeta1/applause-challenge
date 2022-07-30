class Device < ApplicationRecord
  has_many :bugs, foreign_key: :devices_id
  has_many :testers_devices, foreign_key: :devices_id, class_name: 'TestersDevice'
  has_many :testers, through: :testers_devices, source: :testers
end
