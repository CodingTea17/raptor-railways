require 'sinatra'
require 'pry'
require 'sinatra/reloader'
also_reload '.lib/**/*.rb'
require './lib/route'
require './lib/train'
require './lib/city'
require 'pg'

DB = PG.connect({dbname: 'raptor_railways'})


get('/') do
  erb(:index)
end

get('/admin') do
  @routes = Route.all
  @cities = City.all
  @trains = Train.all
  erb(:admin)
end

post('/city') do
  City.new({name: params["name"]}).save
  redirect('/admin')
end

get('/city/update/:id') do
  @city = City.find(params["id"])
  erb(:city)
end

patch('/city/update/:id') do
  City.find(params[:id]).update({:name => params["name"]})
  redirect('/admin')
end

delete('/city/:id') do
  if !(DB.exec("SELECT * FROM routes WHERE city_start_id = #{params[:id]} OR city_end_id = #{params[:id]};")).first
    City.find(params[:id]).delete
    redirect('/admin')
  else
    @conflict = City.find(params[:id]).name
    @error = true
  end
  @routes = Route.all
  @cities = City.all
  @trains = Train.all
  erb(:admin)
end

post('/train') do
  Train.new({name: params["name"], color: params["color"]}).save
  redirect('/admin')
end

get('/train/update/:id') do
  @train = Train.find(params[:id])
  erb(:train)
end

patch('/train/update/:id') do
  Train.find(params[:id]).update({:name => params["name"], :color => params["color"]})
  redirect('/admin')
end

delete('/train/:id') do
  # Train.find(params[:id]).delete
  # redirect('/admin')
  if !(DB.exec("SELECT * FROM routes WHERE train_id = #{params[:id]};")).first
    Train.find(params[:id]).delete
    redirect('/admin')
  else
    @conflict = Train.find(params[:id]).name
    @error = true
  end
  @routes = Route.all
  @cities = City.all
  @trains = Train.all
  erb(:admin)
end

post ('/route') do
  Route.new({:city_start_id => params['city_start_id'], :city_end_id => params['city_end_id'], :train_id => params['train_id'], :time => params['time']}).save
  redirect('/admin')
end

get('/route/update/:id') do
  @cities = City.all
  @trains = Train.all
  @route = Route.find(params[:id])
  erb(:route)
end

patch('/route/update/:id') do
  Route.find(params['id']).update({:city_start_id => params['city_start_id'], :city_end_id => params['city_end_id'], :train_id => params['train_id'], :time => params['time']})
  redirect('/admin')
end

delete('/route/:id') do
  Route.find(params[:id]).delete
  redirect('/admin')
end

get('/home') do
  @cities = City.all
  erb(:home)
end

get('/results') do
  @routes = Route.all
  @cities = City.all
  @trains = Train.all
  erb(:results)
end

post ('/results') do
  @available_routes = Route.search(params['city_start_id'], params['city_end_id'])

  @routes = Route.all
  @cities = City.all
  @trains = Train.all
  erb(:results)
end
