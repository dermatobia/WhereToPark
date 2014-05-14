class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations, id: false do |t|
    	t.primary_key :cid
    	t.string	:description
    end
  end
end
