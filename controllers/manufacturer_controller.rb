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

post'/manufacturers/new' do #CREATE
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  erb( :"manufacturers/create" )
end

get '/manufacturers/:id' do #SHOW
  @manufacturer = Manufacturer.find(params[:id])
  erb( :"manufacturers/show" )
end

get '/manufacturers/:id/edit' do #EDIT
  @manufacturer = Manufacturer.find(params[:id])
  erb( :"manufacturers/edit" )
end

post  '/manufacturers/:id/edit' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.update()
  erb( :"manufacturers/update" )
end

post '/manufacturers/:id/delete' do
  Manufacturer.destroy(params['id'])
  redirect '/manufacturers'
end
