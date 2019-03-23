require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/manufacturer.rb')
require_relative('../models/category.rb')
require_relative('../models/product.rb')
also_reload('../models/*')


get '/inventory' do #INDEX
  @products = Product.all()
  erb( :"inventory/index" )
end

get '/inventory/new' do #NEW
  @manufacturers = Manufacturer.all()
  @categories = Category.all()
  erb(:"inventory/new")
end

get '/inventory/:id' do  #SHOW
  @product = Product.find(params[:id])
  erb( :"inventory/show" )
end

post '/inventory' do #CREATE
  @product = Product.new(params)
  @product.save()
  
end
