# You can create this file by running
# bundle exec rake db:create_migration NAME = contact

class AddContactTable < ActiveRecord::Migration
  def change
  	create_table :contacts do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :phone_number
  		t.integer :user_id
  	end
  end
end
