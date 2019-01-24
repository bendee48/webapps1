require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
    return 'Hello World'
end

get '/hello/' do
    erb :hello_form
    #greeting = params[:greeting] || "Hi There"
    #erb :index, :locals => {'greeting' => greeting}
end

post '/hello/' do
  greeting = params[:greeting] || "Hi there"
  name = params[:name] || 'Nobody'

  erb :index, :locals => {'greeting' => greeting, 'name' => name}
end

get '/biteme/:name' do |x|
  "Bite me #{x}."
end

get '/splatty/*.*' do
  params['splat'][0]
end

get '/hola' do
  erb :hola
end

get '/looky/:name' do
  params.inspect
end

get '/passing/' do
  @name = 'Ben'
  erb :passing
end

get '/comment/' do
  erb :comment
end

post '/comment/' do
  @comment = params[:comment]
  erb :comment_post
end

get '/names/' do
  erb :names
end

def store_name(filename, string)
  File.open('static/' + filename, 'a+') do |file|
    file.puts(string)
  end
end

def read_names(filename)
  return [] unless File.exist?("static/" + filename)
  File.read("static/" + filename).split("\n")
end

post '/names/' do
  @name = params[:name]
  @file = "names.txt"
  store_name(@file, @name)
  @name_list = read_names(@file)
  erb :names_thanks
end

def store_name2(file, name)
  File.open('static/' + file, 'a+') { |f| f.puts(name) }
end

def read_names2
  return [] unless File.exist?('static/names2.txt')
  File.read('static/names2.txt').split("\n")
end

get '/names2/' do
  @name = params[:name]
  @names = read_names2

  erb :names2
end

post '/names2/' do
  @name = params[:name]
  @file = "names2.txt"
  store_name2(@file, @name)
  redirect "/names2/?name=#{@name}"
end
