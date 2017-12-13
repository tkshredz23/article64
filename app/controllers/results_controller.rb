class ResultsController < ApplicationController

  def index
    loc_ids = Location.query(query_params).pluck(:id)
    @votes = Vote.by_location(loc_ids)
    @location = breadcrumb

    unless @votes.any?
      redirect_to results_not_found_path
    end
  end

  def not_found
  end

  def search
    @countries =  Location.all.pluck(:country).uniq
    @states = []
    @cities = []
  end

  def update_states
    @states = Location.query(query_params).pluck(:state).uniq
    respond_to do |format|
      format.js
    end
  end

  def update_cities
    @cities = Location.query(query_params).pluck(:city).uniq
    respond_to do |format|
      format.js
    end
  end

  private

  def query_params
    params.permit(:country, :state, :city)
  end

  def breadcrumb
    array = []

    array << { url: "/", value: 'Accueil' }

    if query_params[:city].present?
      location = Location.query(city: query_params[:city]).first

      array << { url: "/results?country=#{location.country}", value: location.country }
      array << { url: "/results?state=#{location.state}", value: location.state }
      array << { url: "/results?city=#{location.city}", value: location.city }
    elsif query_params[:state].present?
      location = Location.query(state: query_params[:state]).first

      array << { url: "/results?country=#{location.country}", value: location.country }
      array << { url: "/results?state=#{location.state}", value: location.state }
    elsif query_params[:country].present?
      location = Location.query(country: query_params[:country]).first

      array << { url: "/results?country=#{location.country}", value: location.country }
    end

    array
  end
end
