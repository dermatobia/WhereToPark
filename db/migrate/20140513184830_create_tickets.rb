class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.string 	:officer
    	t.datetime 	:incident_time
    	t.string 	:status
    	t.belongs_to :violation
    	t.belongs_to :user
    	t.belongs_to :location
    	t.timestamps 
    end
  end
end
