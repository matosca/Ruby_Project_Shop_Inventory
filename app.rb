require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('controllers/inventory_controller.rb')
require_relative('controllers/manufacturer_controller')
require_relative('controllers/category_controller')

get '/' do
  erb( :index )
end

get '/about' do
  erb(:about)
end
