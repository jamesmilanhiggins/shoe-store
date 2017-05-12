require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

get "/stores" do
  @sorted_stores = Store.all
  erb :stores
end

post "/stores" do
  name = params["name"]
  Store.create({name: name})
  redirect "/stores"
end
