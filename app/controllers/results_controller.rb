class ResultsController < ApplicationController
  before_action :location_select

  def index
    @countries = Location.all_countries
    @states = Location.all_states
    @cities = Location.all_cities

  end

  def update_states
    @cities = Location.all_states(params[:country], params[:state])
    respond_to do |format|
      format.js
    end
  end

  def update_cities
    @cities = Location.all_cities(params[:country])
    respond_to do |format|
      format.js
    end
  end

  private

  def location_select
  end
end
