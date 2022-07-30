# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CSV.foreach("#{Rails.root}/db/testers.csv", :headers => true).each do |row|
  Tester.create(id: row["testerId"], 
    first_name: row["firstName"], 
    last_name: row["lastName"], 
    country: row["country"], 
    last_login: row["lastLogin"])
end

CSV.foreach("#{Rails.root}/db/bugs.csv", :headers => true).each do |row|
  Bug.create(id: row["bugId"], 
    devices_id: row["deviceId"], 
    testers_id: row["testerId"])
end

CSV.foreach("#{Rails.root}/db/devices.csv", :headers => true).each do |row|
  Device.create(id: row["deviceId"], 
    description: row["description"])
end

CSV.foreach("#{Rails.root}/db/tester_device.csv", :headers => true).each do |row|
  Tester.find(row["testerId"]).devices << Device.find(row["deviceId"])
end