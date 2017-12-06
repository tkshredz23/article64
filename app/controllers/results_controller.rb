class ResultsController < ApplicationController

  def index

  end

  def search
    @countries = Location.all_countries
    @states = []
    @cities = []

  end

  def update_states
    @states = Location.all_states(params[:country])

    respond_to do |format|
      format.js
    end
  end

  def update_cities
    @cities = Location.all_cities(params[:country], params[:state])

    respond_to do |format|
      format.js
    end
  end
end
