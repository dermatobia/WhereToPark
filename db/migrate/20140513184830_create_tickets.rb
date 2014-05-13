class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.integer :fine
    	t.string :officer
    	t.datetime :incident_time
    	t.string 	:status
    	t.string :violation
    	t.belongs_to :user
    	t.belongs_to :location
    	t.timestamps 
    end
  end
end
