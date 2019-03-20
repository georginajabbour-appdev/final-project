class RoomateRequestsController < ApplicationController
  def index
    @roomate_requests = RoomateRequest.all

    render("roomate_request_templates/index.html.erb")
  end

  def show
    @roomate_request = RoomateRequest.find(params.fetch("id_to_display"))

    render("roomate_request_templates/show.html.erb")
  end

  def new_form
    @roomate_request = RoomateRequest.new

    render("roomate_request_templates/new_form.html.erb")
  end

  def create_row
    @roomate_request = RoomateRequest.new

    @roomate_request.requestor_id = params.fetch("requestor_id")
    @roomate_request.recipient_id = params.fetch("recipient_id")
    @roomate_request.approved = params.fetch("approved")
    @roomate_request.hotel_id = params.fetch("hotel_id")

    if @roomate_request.valid?
      @roomate_request.save

      redirect_back(:fallback_location => "/roomate_requests", :notice => "Roomate request created successfully.")
    else
      render("roomate_request_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @roomate_request = RoomateRequest.find(params.fetch("prefill_with_id"))

    render("roomate_request_templates/edit_form.html.erb")
  end

  def update_row
    @roomate_request = RoomateRequest.find(params.fetch("id_to_modify"))

    @roomate_request.requestor_id = params.fetch("requestor_id")
    @roomate_request.recipient_id = params.fetch("recipient_id")
    @roomate_request.approved = params.fetch("approved")
    @roomate_request.hotel_id = params.fetch("hotel_id")

    if @roomate_request.valid?
      @roomate_request.save

      redirect_to("/roomate_requests/#{@roomate_request.id}", :notice => "Roomate request updated successfully.")
    else
      render("roomate_request_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @roomate_request = RoomateRequest.find(params.fetch("id_to_remove"))

    @roomate_request.destroy

    redirect_to("/roomate_requests", :notice => "Roomate request deleted successfully.")
  end
end
