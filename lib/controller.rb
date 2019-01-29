
=begin
class ApplicationController < Sinatra::Base
post '/gossips/new/' do
  puts "Ce programme ne fait rien pour le moment, on va donc afficher un message en console"
	erb :new_gossip
end
 
end
=end

require_relative 'gossip'
class ApplicationController < Sinatra::Base
	get '/' do
		erb :new_gossip
	end

  get '/' do
  erb :index, locals: {gossips: Gossip.all}
end

post '/gossips/new/' do
  Gossip.new(params['gossip_author'], params['gossip_content']).save
	redirect '/'
	end

end