class LegsController < ApplicationController
  def index
    @legs = Leg.all

    render("leg_templates/index.html.erb")
  end

  def show
    @leg = Leg.find(params.fetch("id_to_display"))

    render("leg_templates/show.html.erb")
  end

  def new_form
    @leg = Leg.new

    render("leg_templates/new_form.html.erb")
  end

  def create_row
    @leg = Leg.new

    @leg.trip_id = params.fetch("trip_id")

    if @leg.valid?
      @leg.save

      redirect_back(:fallback_location => "/legs", :notice => "Leg created successfully.")
    else
      render("leg_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @leg = Leg.find(params.fetch("prefill_with_id"))

    render("leg_templates/edit_form.html.erb")
  end

  def update_row
    @leg = Leg.find(params.fetch("id_to_modify"))

    @leg.trip_id = params.fetch("trip_id")

    if @leg.valid?
      @leg.save

      redirect_to("/legs/#{@leg.id}", :notice => "Leg updated successfully.")
    else
      render("leg_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @leg = Leg.find(params.fetch("id_to_remove"))

    @leg.destroy

    redirect_to("/legs", :notice => "Leg deleted successfully.")
  end
end
