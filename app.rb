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
  @cities = City.all
  @trains = Train.all
  erb(:admin)
end

post('/city') do
  a_city = City.new({name: params["name"], id: nil})
  a_city.save
  redirect('/admin')
end

get('/city/:name/:id') do
  @name = params[:name]
erb(:city)
end

post('/city/update/:id') do
  name = params["name"]
  City.delete(params[:id])
  redirect('/admin')
end

delete('/city/:id') do
  City.delete(params[:id])
  redirect('/admin')
end

post('/train') do
  a_choo_choo = Train.new({name: params["name"], color: params["color"], id: nil})
  a_choo_choo.save
  redirect('/admin')
end

delete('/train/:id') do
  Train.delete(params[:id])
  redirect('/admin')
end

get('/home') do
  erb(:home)
end
