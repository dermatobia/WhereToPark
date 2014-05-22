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

# ========== POPULATE LOCATIONS & TICKETS TABLES===========

# BORO_CODE to translate Violation County Code (Column 21 in the csv file)
BORO_CODE = { 		
							'NY' => 'New York',
							'BX' => 'Bronx',
							'BRONX' => 'Bronx',
							'K' => 'Brooklyn',
							'Q' => 'Queens',
							'R' => 'Staten Island',
							'RI' => 'Staten Island',
							'RICH' => 'Staten Island',
							nil => 'New York'
						}

CSV.foreach('./db/Parking_Violations_Issued.csv', :headers => true) do |obj|

	# EXTRACT AND POPULATE LOCATION
	house_num = obj[23] == nil ? '' : obj[23]
	street_name = obj[24] == nil ? '' : obj[24]
	intersection = obj[25] == nil ? '' : obj[25]
	county = BORO_CODE[obj[21]]
	full_address = house_num + ' ' + street_name + ' ' + intersection + ' ' + county
	loc  = Location.create(user_submission: full_address)

	# EXTRACT AND POPULATE TICKET
	violation_time = obj[19] == nil ? '0000A' : obj[19]
	violation_time.insert(2, ":").insert(-1, "M")
	p time = obj[4] + ' ' + violation_time + ' EST' 	# In format: "9/18/71 09:50AM EST" 
	dt = DateTime.strptime(time, '%m/%d/%y %H:%M%P %Z').to_time.localtime 
	Ticket.create( 	incident_time: dt,
									violation_id: obj[5].to_i,
									user: User.first, 							# The anonymous user
									location: loc 
								)
end # End of CSV foreach loop



# ======================================
# DOF_Parking_Violation_Codes.csv Headers
# ======================================
# 0. Code
# 1. DEFINITION
# 2. FINE


# ======================================
# Parking_Violations_Issued.csv Headers
# ======================================
# 0	Summons Number
# 1	Plate ID
# 2	Registration State
# 3	Plate Type
# 4	Issue Date
# 5	Violation Code
# 6	Vehicle Body Type
# 7	Vehicle Make
# 8	Issuing Agency
# 9	Street Code1
# 10	Street Code2
# 11	Street Code3
# 12	Vehicle Expiration Date
# 13	Violation Location
# 14	Violation Precinct
# 15	Issuer Precinct
# 16	Issuer Code
# 17	Issuer Command
# 18	Issuer Squad
# 19	Violation Time
# 20	Time First Observed
# 21	Violation County
# 22	Violation In Front Of Or Opposite
# 23	House Number
# 24	Street Name
# 25	Intersecting Street
# 26	Date First Observed
# 27	Law Section
# 28	Sub Division
# 29	Violation Legal Code
# 30	Days Parking In Effect    
# 31	From Hours In Effect
# 32	To Hours In Effect
# 33	Vehicle Color
# 34	Unregistered Vehicle?
# 35	Vehicle Year
# 36	Meter Number
# 37	Feet From Curb
# 38	Violation Post Code
# 39	Violation Description
# 40	No Standing or Stopping Violation
# 41	Hydrant Violation
# 42	Double Parking Violation

