class TestersDevice < ApplicationRecord
  belongs_to :tester, foreign_key: :testers_id, class_name: 'Tester'
  belongs_to :device, foreign_key: :devices_id, class_name: 'Device'
end
