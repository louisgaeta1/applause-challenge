require "rails_helper"

RSpec.describe 'Tester' do 
  before(:each) do
    load "#{Rails.root}/db/seeds.rb" 
  end
  context 'calculates experience' do 
    it 'with one device' do 
      tester = Tester.find(1)
      expect(tester.get_experience([3])).to eq 30  
    end

    it 'with multiple devices' do 
      tester = Tester.find(1)
      expect(tester.get_experience([1,3])).to eq 53  
    end

    it 'with no devices specified' do 
      tester = Tester.find(1)
      expect(tester.get_experience(['ALL'])).to eq 114
    end
  end
end

