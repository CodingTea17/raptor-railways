require 'spec_helper'

describe ('City') do
  describe ('.all') do
    it ('start off with no cities') do
      expect(City.all).to(eq([]))
    end
  end

  describe("#name") do
   it("tells you the city name") do
     city = City.new({name: "Portland", id: nil})
     expect(city.name).to(eq("Portland"))
     end
   end

   describe ('#save') do
     it ('save a city to the databse') do
      city = City.new({name: "Portland", id: nil})
      city.save
      expect(City.all).to(eq([city]))
     end
   end

   describe ('#id') do
     it ('save a city to the databse') do
      city = City.new({name: "Portland", id: nil})
      city.save
      expect(city.id).to(be_an_instance_of(Integer))
     end
   end

  describe("#==") do
    it("is same city if has same name and id") do
      city1 = City.new({name: "Portland", id: nil})
      city2 = City.new({name: "Portland", id: nil})
      expect(city1).to(eq(city2))
    end
  end


end
