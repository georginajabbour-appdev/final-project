class ParticipationsController < ApplicationController
  def index
    @participations = Participation.all

    render("participation_templates/index.html.erb")
  end

  def show
    @participation = Participation.find(params.fetch("id_to_display"))

    render("participation_templates/show.html.erb")
  end

  def new_form
    @participation = Participation.new

    render("participation_templates/new_form.html.erb")
  end

  def create_row
    @participation = Participation.new

    @participation.user_id = params.fetch("user_id")
    @participation.trip_id = params.fetch("trip_id")

    if @participation.valid?
      @participation.save

      redirect_back(:fallback_location => "/participations", :notice => "Participation created successfully.")
    else
      render("participation_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @participation = Participation.find(params.fetch("prefill_with_id"))

    render("participation_templates/edit_form.html.erb")
  end

  def update_row
    @participation = Participation.find(params.fetch("id_to_modify"))

    @participation.user_id = params.fetch("user_id")
    @participation.trip_id = params.fetch("trip_id")

    if @participation.valid?
      @participation.save

      redirect_to("/participations/#{@participation.id}", :notice => "Participation updated successfully.")
    else
      render("participation_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @participation = Participation.find(params.fetch("id_to_remove"))

    @participation.destroy

    redirect_to("/participations", :notice => "Participation deleted successfully.")
  end
end
