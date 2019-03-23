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

get '/manufacturers/:id' do #SHOW
  @manufacturer = Manufacturer.find(params[:id])
  erb( :"manufacturers/show" )
end

post'/manufacturers' do #CREATE
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  # redirect to '/manufacturers'
  erb( :"manufacturers/create" )
end
