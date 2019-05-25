require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative( '../models/category.rb' )

get '/categories' do #INDEX
  @categories = Category.all()
  erb( :"categories/index" )
end

get '/categories/:id' do #SHOW
  @products = Product.all()
  @category = Category.find(params[:id])
  erb( :"categories/show" )
end
