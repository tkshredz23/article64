class ResultsController < ApplicationController

  def index
    loc_ids = Location.query(query_params).pluck(:id)
    @votes = Vote.by_location(loc_ids)
    @location = loc_name

    unless @votes.any?

    end
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

  def loc_name
    if query_params[:city].present?
      query_params[:city]
    elsif query_params[:state].present?
      query_params[:state]
    elsif query_params[:country].present?
      query_params[:country]
    end
  end
end
