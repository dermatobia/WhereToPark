# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# ========== POPULATE BASIC INFO TO VIOLATIONS TABLE ==================

CSV.foreach('./db/DOF_Parking_Violation_Codes.csv', :headers => true) do |obj|
	code = obj[0].to_i
	desc = obj[1]
	fine = obj[2][1..-1].to_i
	Violation.create(cid: code, description: desc, fine: fine)
end

# ========== Create Anonymous User ====================

User.create( 	username: "Anonymous",
							email: "zzz@zzz.com", 
							password: "zzz",
							password_confirmation: "zzz",
							user_type: "A"
							)

# =========== TEMP DUMMY DATA ================

Location.create(user_submission: "34th street 6th avenue, ny, ny")

time = Time.now
Ticket.create(	incident_time: time, 
								violation_id: 4, 
								user_id: 1,
								location_id: 1
							)

# ========== POPULATE TICKETS ===========

# incident_time = 6
# violation_id = 7
# user_id = Anonymous
# location = join columns, find and create location
