class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render({ template: "movie_templates/index" })
  end

  def show
    @movie = Movie.find(params[:id])
    render({ template: "movie_templates/show" })
  end

  def create
    new_movie = Movie.new
    new_movie.title = params.fetch("query_title")
    new_movie.year = params.fetch("query_year").to_i
    new_movie.duration = params.fetch("query_duration").to_i
    new_movie.description = params.fetch("query_description", "")
    new_movie.image = params.fetch("query_image", "")
    new_movie.director_id = params.fetch("query_director_id").to_i

    if new_movie.save
      redirect_to("/movies")
    else
      render({ template: "movie_templates/index" })
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    redirect_to("/movies")
  end

  def update
    movie = Movie.find(params[:id])
    movie.title = params.fetch("query_title", movie.title)
    movie.year = params.fetch("query_year", movie.year).to_i
    movie.duration = params.fetch("query_duration", movie.duration).to_i
    movie.description = params.fetch("query_description", movie.description)
    movie.image = params.fetch("query_image", movie.image)
    movie.director_id = params.fetch("query_director_id", movie.director_id).to_i
  
    if movie.save
      redirect_to("/movies/#{movie.id}")
    else
      render({ template: "movie_templates/show" })
    end
  
  end
end
