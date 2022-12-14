class Tester < ApplicationRecord
  has_many :testers_devices, foreign_key: :testers_id, class_name: 'TestersDevice'
  has_many :devices, through: :testers_devices, source: :device
  has_many :bugs, foreign_key: :testers_id

  def get_experience(device_ids)
    return self.bugs.where(devices_id: device_ids).count if !device_ids.include?('ALL')
    return self.bugs.count
  end
end
