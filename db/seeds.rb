# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Tester.count.zero?
  CSV.foreach("#{Rails.root}/db/testers.csv", :headers => true).each do |row|
    Tester.create(id: row["testerId"], 
      first_name: row["firstName"], 
      last_name: row["lastName"], 
      country: row["country"], 
      last_login: row["lastLogin"])
  end
end

if Device.count.zero?
  CSV.foreach("#{Rails.root}/db/devices.csv", :headers => true).each do |row|
    Device.create(id: row["deviceId"], 
      description: row["description"])
  end
end

if Bug.count.zero?
  CSV.foreach("#{Rails.root}/db/bugs.csv", :headers => true).each do |row|
    bug = Bug.new(id: row["bugId"])
    bug.device = Device.find(row["deviceId"])
    bug.tester = Tester.find(row["testerId"])
    bug.save
  end
end

if TestersDevice.count.zero?
  CSV.foreach("#{Rails.root}/db/tester_device.csv", :headers => true).each do |row|
    Tester.find(row["testerId"]).devices << Device.find(row["deviceId"])
  end
end