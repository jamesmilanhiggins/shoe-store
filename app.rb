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
  @store = Store.create({name: name})
  if @store.save
    redirect "/stores"
  else
    erb :store_errors
  end
end

get "/stores/:id" do
  store_id = params["id"].to_i
  @store = Store.find(store_id)
  @list_brands = Brand.all
  erb :store
end

delete "/stores/:id" do
  store_id = params["id"].to_i
  store = Store.find(store_id)
  store.destroy
  redirect "/stores"
end

patch "/stores/:id" do
  store_id = params["id"].to_i
  store = Store.find(store_id)
  name = params["name"]
  store.update({name: name})
  redirect "/stores/#{store_id}"
end

#add brand to a specific store
post "/stores/:id" do
  store_id = params["id"].to_i
  brand_id = params["brand_id"].to_i
  store = Store.find(store_id)
  store.brands.push(Brand.find(brand_id))
  redirect "/stores/#{store_id}"
end

##Brand Section
get "/brands" do
  @brands = Brand.all
  erb :brands
end

post "/brands" do
  name = params["name"]
  price = params["price"]
  @brand = Brand.create({name: name, price: price})
  if @brand.save
    redirect "/brands"
  else
    erb :brand_errors
  end
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

patch "/brands/:id" do
  brand_id = params["id"].to_i
  brand = Brand.find(brand_id)
  name = params["name"]
  brand.update({name: name})
  redirect "/brands/#{brand_id}"
end
