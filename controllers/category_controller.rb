require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/category.rb' )
also_reload( '../models/*' )

get '/categories' do #INDEX
  @categories = Category.all()
  erb( :"categories/index" )
end

get '/categories/:id' do #SHOW
  @category = Category.find(params[:id])
  erb( :"categories/show" )
end

post '/categories/:id/delete' do
  Category.destroy(params['id'])
  redirect '/categories'
end
