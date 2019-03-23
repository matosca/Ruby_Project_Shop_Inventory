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

post '/inventory' do #CREATE
  @product = Product.new(params)
  @product.save()
  # redirect to ("/inventory")
  erb( :"inventory/create" )
end

get '/inventory/:id' do  #SHOW
  @product = Product.find(params[:id])
  erb( :"inventory/show" )
end

get '/inventory/:id/edit' do #EDIT
  @manufacturers = Manufacturer.all()
  @categories = Category.all()
  @product = Product.find(params['id'])
  erb( :"inventory/edit" )
end

post '/inventory/:id' do  #UPDATE
  @product = Product.new(params)
  @product.update()
  erb(:"inventory/update")
end

post '/inventory/:id/delete' do
  @product = Product.find(params[:id])
  @product.delete()
  redirect to '/inventory'
end
