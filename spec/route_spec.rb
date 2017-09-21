require 'spec_helper'

describe ('Route') do
  describe ('.all') do
    it ('start off with no routes') do
      expect(Route.all).to(eq([]))
    end
  end

  describe("#city_start_id") do
   it("tells you the route name") do
     route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00'})
     expect(route.city_start_id).to(eq(1))
     end
   end

  describe ('#save') do
     it ('save a route to the databse') do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00'})
      route.save
      expect(Route.all).to(eq([route]))
     end
   end

  describe ('#id') do
    it ('save a route to the databse') do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00'})
      route.save
      expect(route.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe '#update' do
    it 'will update a given route' do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00'})
      route.save
      route.update({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-06 08:00:00', id: route.id})
      expect(Route.all).to eq([route])
    end
  end

  describe '#find' do
    it 'will find a route from the db using an id' do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00'})
      id = route.save
      expect(Route.find(id)).to eq(route)
    end
  end

  describe '#delete' do
    it 'will delete a given route' do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00'})
      route.save
      route.delete
      expect(Route.all).to eq([])
    end
  end

  describe '#search' do
    it 'will return matching routes' do
      route_to_nowhere = Route.new({city_start_id: 3, city_end_id: 6, train_id: 1, time: '2017-05-05 08:00:00'})
      route_to_nowhere.save
      route_to_nowhere2 = Route.new({city_start_id: 3, city_end_id: 6, train_id: 2, time: '2017-05-09 08:00:00'})
      route_to_nowhere2.save
      expect(Route.search(3,6)).to eq([route_to_nowhere,route_to_nowhere2])
    end
  end
end
