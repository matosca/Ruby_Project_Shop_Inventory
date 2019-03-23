require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/inventory_controller.rb')
require_relative('controllers/manufacturer_controller')
require_relative('controllers/category_controller')

get '/' do
  erb( :index )
end
