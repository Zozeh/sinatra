
=begin
class ApplicationController < Sinatra::Base
get '/gossips/new/' do
  erb :new_gossip
end
 
end
=end



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
		erb :index, locals: {gossips: Gossip.all}
	end
post '/gossips/new/' do
  Gossip.new(params['gossip_author'], params['gossip_content']).save
	redirect '/'
	end

	def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
end
end