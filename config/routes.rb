Rails.application.routes.draw do
  # Actors Routes
  get("/actors", { controller: "actors", action: "index" })
  get("/actors/:id", { controller: "actors", action: "show" })
  post("/insert_actor", { controller: "actors", action: "create" })
  get("/delete_actor/:id", { controller: "actors", action: "destroy" })
  post("/update_actor/:id", { controller: "actors", action: "update" })

  # Directors Routes
  get("/directors", { controller: "directors", action: "index" })
  get("/directors/:id", { controller: "directors", action: "show" })
  post("/insert_director", { controller: "directors", action: "create" })
  get("/delete_director/:id", { controller: "directors", action: "destroy" })
  post("/update_director/:id", { controller: "directors", action: "update" })

  # Movies Routes
  get("/movies", { controller: "movies", action: "index" })
  get("/movies/:id", { controller: "movies", action: "show" })
  post("/insert_movie", { controller: "movies", action: "create" })
  get("/delete_movie/:id", { controller: "movies", action: "destroy" })
  post("/update_movie/:id", { controller: "movies", action: "update" })
end
