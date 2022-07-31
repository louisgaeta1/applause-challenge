class TesterController < ApplicationController


  def index
    @countries = Tester.all.pluck(:country).uniq.collect {|country| [country, country]}
    @devices = Device.all.collect {|device| [device.description, device.id] }
  end


  def search
    @countries = Tester.all.pluck(:country).uniq.collect {|country| [country, country]}
    @devices = Device.all.collect {|device| [device.description, device.id] }
    @results = nil
    countries = params[:countries].reject(&:blank?).blank? ? ['ALL'] : params[:countries].reject(&:blank?)
    devices = params[:devices].reject(&:blank?).blank? ? ['ALL'] : params[:devices].reject(&:blank?)
    testers_result = nil
    if countries.include?('ALL') && devices.include?('ALL')
      testers_result = Tester.all.sort_by do |tester| 
        tester.bugs.count
      end
      @results = testers_result.reverse.map {|tester| tester.serializable_hash.merge({"experience" => tester.bugs.count})}
    else
      if !countries.include?('ALL')
        testers_result = Tester.where(country: countries)
      else
        testers_result = Tester.all
      end
      if !devices.include?('ALL')
        testers_result = testers_result.select do |tester|
          devices.any?{|device| tester.devices.pluck(:id).include?(device.to_i)}
        end
        testers_result = testers_result.sort_by { |tester| tester.get_experience(devices)}
        @results = testers_result.reverse.map {|tester| tester.serializable_hash.merge({"experience" => tester.get_experience(devices)})}
      else
        testers_result = testers_result.sort_by {|tester| tester.bugs.count }
        @results = testers_result.reverse.map {|tester| tester.serializable_hash.merge({"experience" => tester.bugs.count})}
      end
    end

    respond_to do |format|
      format.html { render :index }
    end
  end
end
