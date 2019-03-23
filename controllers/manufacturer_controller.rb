require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb' )
also_reload( '../models/*' )

get '/manufacturers' do #INDEX
  @manufacturers = Manufacturer.all()
  erb( :"manufacturers/index" )
end

get '/manufacturers/new' do #NEW
  erb( :"manufacturers/new" )
end

post'/manufacturers' do #CREATE
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  # redirect to '/manufacturers'
  erb( :"manufacturers/create" )
end

get '/manufacturers/:id' do #SHOW
  @manufacturer = Manufacturer.find(params[:id])
  erb( :"manufacturers/show" )
end

get '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.find(params[:id])
  erb( :"manufacturers/edit" )
end

post  '/manufacturers/:id' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.update()
  # redirect to '/manufacturers'
  erb( :"manufacturer/update" )
end

post '/manufactureres/:id/delete' do
  manufacturer = Manufacturer.find(params[:id])
  manufacturer.delete()
  redirect to '/manufacturers'
end
