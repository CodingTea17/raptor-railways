require 'spec_helper'

RSpec.describe Train do
  describe(".all") do
    it("will alphabetically list all the choo choos in the db") do
      expect(Train.all).to(eq([]))
    end
  end

  describe "#save" do
    it("will put a choo choo into the db") do
      golden_raptor = Train.new({name: 'Golden Raptor', color: 'Gold', id: nil})
      golden_raptor.save
      expect(Train.all).to eq([golden_raptor])
    end
  end

  describe '.==' do
    it("will compare two choo choos") do
      golden_raptor = Train.new({name: 'Golden Raptor', color: 'Gold', id: nil})
      other_golden_raptor = Train.new({name: 'Golden Raptor', color: 'Gold', id: nil})
      expect(golden_raptor).to eq(other_golden_raptor)
    end
  end

  describe '#id' do
    it ('will save a choo choo to the db and return an id') do
     train = Train.new({name: 'Golden Raptor', color: 'Gold', id: nil})
     train.save
     expect(train.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe '#update' do
    it 'will update a row in the choo choo table' do
      train = Train.new({name: 'Golden Raptor', color: 'Gold'})
      train.save
      train.update({name: 'Silver Raptor', color: 'Silver', id: train.id})
      expect(Train.all).to eq([train])
    end
  end

  describe('.find') do
    it('will find a train in the database by it id') do
      train = Train.new({name: 'Golden Raptor', color: 'Gold'})
      id = train.save
      expect(Train.find(id)).to eq(train)
    end
  end


  describe '#delete' do
    it 'will delete a row in the choo choo table' do
      train = Train.new({name: 'Golden Raptor', color: 'Gold'})
      train.save
      train.delete
      expect(Train.all).to(eq([]))
    end
  end
end
