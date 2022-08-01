require "rails_helper"

RSpec.describe 'TesterController' do 
  before(:each) do
    load "#{Rails.root}/db/seeds.rb" 
    @controller = TesterController.new()
  end
  context 'map_testers_to_display_hash' do
    it 'returns an array hashes' do
      testers = Tester.all
      expect(@controller.map_testers_to_display_hash(testers, ['ALL'])).to be_a(Array)
      expect(@controller.map_testers_to_display_hash(testers, ['ALL']).first).to be_a(Hash)
    end

    it 'adds experience to each record' do
      testers = Tester.all
      expect(@controller.map_testers_to_display_hash(testers, ['ALL']).first).to have_key("experience")
      expect(@controller.map_testers_to_display_hash(testers, ['ALL']).last).to have_key("experience")
      expect(@controller.map_testers_to_display_hash(testers, ['ALL']).first["experience"]).to be_a(Integer)
      expect(@controller.map_testers_to_display_hash(testers, ['ALL']).first["experience"]).to be >= 0
    end
  end

  context 'sort_by_experience' do
    it 'sorts by experience descending' do
      testers = [Tester.first, Tester.last]
      expect(@controller.sort_by_experience(testers, [1,3]).first).to eq Tester.first
    end
  end


  context 'filter_testers_by_device_experience' do
    it 'removes testers without device experience' do
      testers = [Tester.first, Tester.last]
      starting_length = testers.length
      filtered_results = @controller.filter_testers_by_device_experience(testers, [1,3])

      expect(filtered_results.length).to be < starting_length
      expect(filtered_results).not_to include(Tester.last)
    end
  end
  
end