require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )
also_reload( '../models/*' )

get '/categories' do #INDEX
  @categories = Category.all()
  erb( :"categories/index" )
end
