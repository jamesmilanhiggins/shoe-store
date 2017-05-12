require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

## Stores Section
get "/stores" do
  @stores = Store.all
  erb :stores
end

post "/stores" do
  name = params["name"]
  Store.create({name: name})
  redirect "/stores"
end

get "/stores/:id" do
  store_id = params["id"].to_i
  @store = Store.find(store_id)
  erb :store
end

delete "/stores/:id" do
  store_id = params["id"].to_i
  store = Store.find(store_id)
  store.destroy
  redirect "/stores"
end
# patch ""

# delete "/stores/:id" do
#   store_id = params["id"].to_i
#   store = Store.find(store_id)
#   store.destroy
#   redirect "/stores"
# end


##Brand Section

get "/brands" do
  @brands = Brand.all
  erb :brands
end

post "/brands" do
  name = params["name"]
  price = params["price"].to_i
  @brand = Brand.create({name: name, price: price})
  redirect "/brands"
end

get "/brands/:id" do
  id = params["id"].to_i
  @brand = Brand.find(id)
  erb :brand
end

delete "/brands/:id" do
  brand_id = params["id"].to_i
  brand = Brand.find(brand_id)
  brand.destroy
  redirect "/brands"
end
