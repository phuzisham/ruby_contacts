require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contact.sort
  erb(:input)
end

get('/output/:last_name') do
  @contact = Contact.find(params[:last_name])
  erb(:output)
end

post('/output/:last_name') do
  @contact = Contact.find(params[:last_name])
  @contact.add_address({:street_address=>params["street_address"],:city=>params["city"],:state=>params["state"],:zip_code=>params["zip_code"]})
  erb(:output)
end

post('/output') do
  @contact = Contact.new({:first_name=>params["first_name"],:last_name=>params["last_name"],:number=>params["number"]})
  @contact.save()
  @contacts = Contact.sort
  erb(:input)
end
