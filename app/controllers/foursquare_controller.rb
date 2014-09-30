class FoursquareController < ApplicationController
  def index
    @form = FoursquareSearchForm.new
  end

  def search
    @form = FoursquareSearchForm.new(params[:foursquare_search_form])
    @results = @form.search_venues
    render :index
  end
end
