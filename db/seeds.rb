# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# ========== POPULATE BASIC INFO TO VIOLATIONS TABLE ==================

# CSV.foreach('./db/DOF_Parking_Violation_Codes.csv', :headers => true) do |obj|
# 	code = obj[0].to_i
# 	desc = obj[1]
# 	Violation.create(cid: code, description: desc)
# end

# ========== Create Anonymous User ====================

User.create( 	username: "Anonymous",
							email: "zzz@zzz.com", 
							password: "zzz",
							password_confirmation: "zzz",
							user_type: "A"
							)

 # => User(id: integer, username: string, email: string, password_digest: string, user_type: string, created_at: datetime, updated_at: datetime) 