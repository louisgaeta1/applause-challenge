class TesterController < ApplicationController
  before_action :retrieve_countries, only: [:index, :search]
  before_action :retrieve_devices, only: [:index, :search]

  def index
  end

  def search
    countries = params[:countries].reject(&:blank?).blank? ? ['ALL'] : params[:countries].reject(&:blank?)
    devices = params[:devices].reject(&:blank?).blank? ? ['ALL'] : params[:devices].reject(&:blank?)
    tester_group = countries.include?('ALL') ? Tester.all : Tester.where(country: countries)
    tester_group = filter_testers_by_device_experience(tester_group, devices) unless devices.include?('ALL')
    testers_result = sort_by_experience(tester_group, devices)
    @results = map_testers_to_display_hash(testers_result, devices)
    @message = 'No Results' if @results.empty?
    respond_to do |format|
      format.html { render :index }
    end
  end

  def sort_by_experience(testers, devices)
    return testers.sort_by { |tester| tester.get_experience(devices) }.reverse
  end

  def filter_testers_by_device_experience(testers, devices)
    testers.select do |tester|
      devices.any?{|device| tester.devices.pluck(:id).include?(device.to_i)}
    end
  end

  def map_testers_to_display_hash(testers, devices)
    return testers.map {|tester| tester.serializable_hash.merge({"experience" => tester.get_experience(devices)})}
  end

  def retrieve_devices
    @devices = Device.all.collect {|device| [device.description, device.id] }
  end

  def retrieve_countries
    @countries = Tester.all.pluck(:country).uniq.collect {|country| [country, country]}
  end
end
