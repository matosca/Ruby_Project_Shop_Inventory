require('sinatra')
require('sinatra/contrib/all')
require_relative('/models/manufacturer.rb')
require_relative('/models/category.rb')
require_relative('/models/product.rb')
also_reload('./models/*')


get '/stock-list' do #INDEX
  @products = Product.all()
  erb( :index )
end
