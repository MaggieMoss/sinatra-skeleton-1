# Homepage (Root path)
get '/' do
  erb :index
end

get '/contacts' do 
	# return all of the contacts in the database by calling 'all' method on the Contact Class
	@contacts = Contact.all
	erb :'contact/contacts'
end

get '/contacts/new' do 
	# give the user the HTML form for creating a new user.
	erb :'contact/new_contact'
end 

get '/contacts/search' do 
	# return the search html form 
	erb :'contact/search'
end


get '/contacts/:id' do 
	# get the id from the parameter hash
	user_id = params[:id]
	# pass it into the find method on the contact class
	@contact = Contact.find(user_id)
	# return the erb file that will show the individual contact
	erb :'contact/show'
end 

post '/contacts/new' do 
	# get all of the information you'll need to make a new user from the parameter hash.
	# the 'key' for the hash will match what you put in the "name" attribute on the form.
	email = params[:email]
	first_name = params[:first_name]
	last_name = params[:last_name]
	phone_number = params[:phone_number]

	# Create a new contact
	@contact = Contact.new
	@contact.first_name = first_name
	@contact.last_name = last_name
	@contact.phone_number = phone_number
	@contact.email = email
	# make sure you save the contact to the database
	@contact.save 

	#redirect the user to view the contact they just created:
	erb :'contact/show'
end 

