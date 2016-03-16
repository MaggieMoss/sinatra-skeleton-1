# HELPER METHODS
helpers do 
	def current_user
		User.find_by(id: session[:user_id])
	end 

	def logged_in 
		if(session[:user_id])
			true
		else 
			false
		end 
	end
end


# Homepage (Root path)
get '/' do
  erb :index
end

# ACTIONS/ROUTES FOR CONTACTS

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

post '/contacts/search' do
	
	# get the search term from the parameters - remember with a post the parameters have 
	# the same key as the "name" attribute in your form
	search_term = params[:search]
	
	# This a more complicated Query. 
	# Challenge: Try to implement a search where it's just looking for a name.
	@contacts = Contact.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "#{search_term}","#{search_term}","#{search_term}")
	
	# we can reuse this HTML template to loop over our results.
	erb :'contact/contacts'
end

# ACTIONS/ROUTES FOR USERS 
get '/login' do 
	erb :login
end 

post '/login' do 
	username = params[:username]
	password = params[:password]

	# find the user by the user name
	@user = User.find_by(username: username)

	# if we got a user back/if the user exists
	# check to see if the password matches
	if @user && @user.password == password 
		session[:user_id] = @user.id
		"Logged in"
	else 
		"Login failed"
	end 
end 

get '/login' do
	session[:user_id] = nil
	"Logged out"
end

get '/users/create' do 
	erb :'user/create'
end 

post '/users/create' do
	# get the information you need to get from the params to create a new user.
	# NOTE: think about what validations we would need to add to our app.
	username = params[:username]
	password = params[:password]
	email = params[:email]
	# create new User
	@user = User.new({email: email, password: password, username: username})
	@user.save
	redirect ('/')
end



















