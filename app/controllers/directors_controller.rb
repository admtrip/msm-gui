class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render({ template: "director_templates/index" })
  end

  def show
    @director = Director.find(params[:id])
    @movies_by_director = Movie.where(director_id: @director.id)
    render({ template: "director_templates/show" })
  end

  def create
    new_director = Director.new
    new_director.name = params.fetch("query_name")
    new_director.dob = params.fetch("query_dob", nil)
    new_director.bio = params.fetch("query_bio", "")
    new_director.image = params.fetch("query_image", "")

    if new_director.save
      redirect_to("/directors")
    else
      render({ template: "director_templates/index" })
    end
  end

  def destroy
    director = Director.find(params[:id])
    director.destroy

    redirect_to("/directors")
  end

  def update
    director = Director.find(params[:id])
    director.image = params.fetch("query_image")

    if director.save
      redirect_to("/directors/#{director.id}")
    else
      render({ template: "director_templates/show" })
    end

    def youngest
      @youngest_director = Director.where.not(dob: nil).order(dob: :desc).first
      render({ template: "director_templates/youngest" })
    end
    
    def eldest
      @eldest_director = Director.where.not(dob: nil).order(dob: :asc).first
      render({ template: "director_templates/eldest" })
    end
       
  end
end
