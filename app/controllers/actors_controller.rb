class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render({ template: "actor_templates/index" })
  end

  def show
    @actor = Actor.find(params[:id])
    @characters = Character.where(actor_id: @actor.id).includes(:movie)
    render({ template: "actor_templates/show" })
  end

  def create
    new_actor = Actor.new
    new_actor.name = params.fetch("query_name")
    new_actor.dob = params.fetch("query_dob", nil)
    new_actor.image = params.fetch("query_image", "")
    new_actor.save

    redirect_to("/actors")
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy

    redirect_to("/actors")
  end

  def update
    actor = Actor.find(params[:id])
    actor.image = params.fetch("query_image")
    actor.save

    redirect_to("/actors/#{actor.id}")
  end
end
