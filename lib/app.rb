require "sinatra"
require "sinatra/json"
require "sinatra/reloader" if development?

configure do
  set :public_folder, File.dirname(__FILE__) + "/../public"
end

get "/json/*" do |json_file|
  json_path = File.join("public", json_file)
  pass unless File.exist?(json_path)
  # do something
  # response["Access-Control-Allow-Origin"] = "*"
  json JSON.parse(open(json_path).read)
end
