class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all

    render("hotel_templates/index.html.erb")
  end

  def show
    @hotel = Hotel.find(params.fetch("id_to_display"))

    render("hotel_templates/show.html.erb")
  end

  def new_form
    @hotel = Hotel.new

    render("hotel_templates/new_form.html.erb")
  end

  def create_row
    @hotel = Hotel.new

    @hotel.name = params.fetch("name")
    @hotel.user_id = params.fetch("user_id")
    @hotel.leg_id = params.fetch("leg_id")

    if @hotel.valid?
      @hotel.save

      redirect_back(:fallback_location => "/hotels", :notice => "Hotel created successfully.")
    else
      render("hotel_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @hotel = Hotel.find(params.fetch("prefill_with_id"))

    render("hotel_templates/edit_form.html.erb")
  end

  def update_row
    @hotel = Hotel.find(params.fetch("id_to_modify"))

    @hotel.name = params.fetch("name")
    @hotel.user_id = params.fetch("user_id")
    @hotel.leg_id = params.fetch("leg_id")

    if @hotel.valid?
      @hotel.save

      redirect_to("/hotels/#{@hotel.id}", :notice => "Hotel updated successfully.")
    else
      render("hotel_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @hotel = Hotel.find(params.fetch("id_to_remove"))

    @hotel.destroy

    redirect_to("/hotels", :notice => "Hotel deleted successfully.")
  end
end
