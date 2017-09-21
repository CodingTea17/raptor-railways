require 'spec_helper'

describe ('City') do
  describe ('.all') do
    it ('start off with no cities') do
      expect(City.all).to(eq([]))
    end
  end

  describe("#name") do
   it("tells you the city name") do
     city = City.new({name: "Portland"})
     expect(city.name).to(eq("Portland"))
     end
   end

   describe ('#save') do
     it ('save a city to the databse') do
      city = City.new({name: "Portland"})
      city.save
      expect(City.all).to(eq([city]))
     end
   end

   describe ('#id') do
     it ('save a city to the databse') do
      city = City.new({name: "Portland"})
      city.save
      expect(city.id).to(be_an_instance_of(Fixnum))
     end
   end

  describe("#==") do
    it("is same city if has same name and id") do
      city1 = City.new({name: "Portland"})
      city2 = City.new({name: "Portland"})
      expect(city1).to(eq(city2))
    end
  end

  describe '#update' do
    it 'will update a row in the cities table' do
      city = City.new({name: 'Portland'})
      city.save
      city.update({:name => 'Seattle'})
      expect(City.all).to eq([city])
    end
  end

  describe '.find' do
    it 'will find an object in the db by it\'s id' do
      city = City.new({name: 'Portland'})
      id = city.save
      expect(City.find(id)).to eq(city)
    end
  end

  describe '#delete' do
    it 'will delete a row in the cities table' do
      city = City.new({name: 'Portland'})
      city.save
      city.delete
      expect(City.all).to(eq([]))
    end
  end
end
