require 'spec_helper'

describe ('Route') do
  describe ('.all') do
    it ('start off with no routes') do
      expect(Route.all).to(eq([]))
    end
  end

  describe("#city_start_id") do
   it("tells you the route name") do
     route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00', id: nil})
     expect(route.city_start_id).to(eq(1))
     end
   end

  describe ('#save') do
     it ('save a route to the databse') do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00', id: nil})
      route.save
      expect(Route.all).to(eq([route]))
     end
   end

  describe ('#id') do
    it ('save a route to the databse') do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00', id: nil})
      route.save
      expect(route.id).to(be_an_instance_of(Integer))
    end
  end

  describe '#update' do
    it 'will update a given route' do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00', id: nil})
      route.save
      route.update({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-06 08:00:00', id: route.id})
      expect(Route.all).to eq([route])
    end
  end

  describe '#delete' do
    it 'will delete a given route' do
      route = Route.new({city_start_id: 1, city_end_id: 2, train_id: 1, time: '2017-05-05 08:00:00', id: nil})
      route.save
      route.delete
      expect(Route.all).to eq([])
    end
  end
end
