#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'pony'
get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
#    @error = 'something wrong!'
    erb :about
end

get'/visit' do
	erb :visit
end

get '/contacts' do
#Pony.mail(
 #  :name => params[:name],
 # :mail => params[:mail],
 # :body => params[:body],
  #:to => 'testingemail116@gmail.com',
  #:subject => params[:name] + " has contacted you",
  #:body => params[:message],
#  :port => '587',
# :via => :smtp,
 # :via_options => { 
  #  :address              => 'smtp.gmail.com', 
   # :port                 => '587', 
  #  :enable_starttls_auto => true, 
  #  :user_name            => 'lumbee', 
  #  :password             => 'pa55w0rd8856', 
  #  :authentication       => :plain, 
  #  :domain               => 'localhost.localdomain'
 # })
#redirect '/success' 
#end
	erb :contacts
end	

post '/visit' do #обработка запроса

@username = params[:username]
@contact_phone = params[:contact_phone]
@visit_time = params[:visit_time]
@barber = params[:barber]
@color = params[:color]

# хэш
hh = {:username => 'Enter your name' ,
	:contact_phone => 'Enter your phone' ,
	:visit_time => 'Enter date and time' }


@error = hh.select {|key,_| params[key] == ""}.values.join(",")
if @error !=''
	return erb :visit
end

erb "OK,username is #{@username},
phone number #{@contact_phone}, 
time #{@visit_time} Цурюльнег будет #{@barber} цвет #{@color}!"

end



#get '/contacts' do
 # erb :contacts
#end`

