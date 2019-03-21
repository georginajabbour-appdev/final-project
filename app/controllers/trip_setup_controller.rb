class TripSetupController < ApplicationController

  
  def new_form
    @trip = Trip.new

    render("trip_templates/new_form.html.erb")
  end

  def create_row
    @trip = Trip.new

    @trip.name = params.fetch("name")
    @trip.manager_id = params.fetch("manager_id")
    @trip.description = params.fetch("description")

    if @trip.valid?
      @trip.save

      redirect_to("/trips", :notice => "Trip created successfully.")
    else
      render("trip_templates/new_form_with_errors.html.erb")
    end
  end


end