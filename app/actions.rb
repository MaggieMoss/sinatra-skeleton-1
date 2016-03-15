# Homepage (Root path)
get '/' do
  erb :index
end

get '/contacts' do 
	# return all of the contacts in the database
	@contacts = Contact.all
	erb :'contact/contacts'
end

get '/contacts/new' do 
	erb :'contact/new_contact'
end 

get '/contacts/search' do 
	erb :'contacts/search'
end


get '/contacts/:id' do 
	user_id = params[:id]
	@contact = Contact.find(user_id)
	erb :'contact/show'
end 

