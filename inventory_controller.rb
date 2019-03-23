require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/manufacturer.rb')
require_relative('./models/category.rb')
require_relative('./models/product.rb')
also_reload('./models/*')


get '/stock-list' do #INDEX
  @products = Product.all()
  erb( :index )
end

get '/stock-list/:id' do
  @product = Product.find(params[:id])
  erb( :show )
end
