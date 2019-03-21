Rails.application.routes.draw do
  # Routes for the Leg resource:

  # CREATE
  get("/legs/new", { :controller => "legs", :action => "new_form" })
  post("/create_leg", { :controller => "legs", :action => "create_row" })

  # READ
  get("/legs", { :controller => "legs", :action => "index" })
  get("/legs/:id_to_display", { :controller => "legs", :action => "show" })

  # UPDATE
  get("/legs/:prefill_with_id/edit", { :controller => "legs", :action => "edit_form" })
  post("/update_leg/:id_to_modify", { :controller => "legs", :action => "update_row" })

  # DELETE
  get("/delete_leg/:id_to_remove", { :controller => "legs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Roomate request resource:

  # CREATE
  get("/roomate_requests/new", { :controller => "roomate_requests", :action => "new_form" })
  post("/create_roomate_request", { :controller => "roomate_requests", :action => "create_row" })

  # READ
  get("/roomate_requests", { :controller => "roomate_requests", :action => "index" })
  get("/roomate_requests/:id_to_display", { :controller => "roomate_requests", :action => "show" })

  # UPDATE
  get("/roomate_requests/:prefill_with_id/edit", { :controller => "roomate_requests", :action => "edit_form" })
  post("/update_roomate_request/:id_to_modify", { :controller => "roomate_requests", :action => "update_row" })

  # DELETE
  get("/delete_roomate_request/:id_to_remove", { :controller => "roomate_requests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Hotel resource:

  # CREATE
  get("/hotels/new", { :controller => "hotels", :action => "new_form" })
  post("/create_hotel", { :controller => "hotels", :action => "create_row" })

  # READ
  get("/hotels", { :controller => "hotels", :action => "index" })
  get("/hotels/:id_to_display", { :controller => "hotels", :action => "show" })

  # UPDATE
  get("/hotels/:prefill_with_id/edit", { :controller => "hotels", :action => "edit_form" })
  post("/update_hotel/:id_to_modify", { :controller => "hotels", :action => "update_row" })

  # DELETE
  get("/delete_hotel/:id_to_remove", { :controller => "hotels", :action => "destroy_row" })

  #------------------------------

  # Routes for the Participation resource:

  # CREATE
  get("/participations/new", { :controller => "participations", :action => "new_form" })
  post("/create_participation", { :controller => "participations", :action => "create_row" })

  # READ
  get("/participations", { :controller => "participations", :action => "index" })
  get("/participations/:id_to_display", { :controller => "participations", :action => "show" })

  # UPDATE
  get("/participations/:prefill_with_id/edit", { :controller => "participations", :action => "edit_form" })
  post("/update_participation/:id_to_modify", { :controller => "participations", :action => "update_row" })

  # DELETE
  get("/delete_participation/:id_to_remove", { :controller => "participations", :action => "destroy_row" })

#------------------------------

  # Routes for the Trip setup:

  # CREATE
  get("/trip_setup/new", { :controller => "trip_setup", :action => "new_form" })
  post("/create_trip_setup", { :controller => "trip_setup", :action => "create_row" })



  #------------------------------

  # Routes for the Trip resource:
  
  root "trips#index"

  # CREATE
  get("/trips/new", { :controller => "trips", :action => "new_form" })
  post("/create_trip", { :controller => "trips", :action => "create_row" })

  # READ
  get("/trips", { :controller => "trips", :action => "index" })
  get("/trips/:id_to_display", { :controller => "trips", :action => "show" })

  # UPDATE
  get("/trips/:prefill_with_id/edit", { :controller => "trips", :action => "edit_form" })
  post("/update_trip/:id_to_modify", { :controller => "trips", :action => "update_row" })

  # DELETE
  get("/delete_trip/:id_to_remove", { :controller => "trips", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
