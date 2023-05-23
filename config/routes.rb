Rails.application.routes.draw do
  # refactoring all of the below, using a single line of code:
  resources :tasks

  # Defines the root path route ("/")
  # root "tasks#index"

  # get "/tasks", to: "tasks#index"

  # get "/tasks/new", to: "tasks#new", as: :new_task

  # post "tasks", to: "tasks#create"

  # get "/tasks/:id", to: "tasks#show", as: :task

  # # you need to specify the as option for the edit route so that the edit_task_path helper is available:
  # get "/tasks/:id/edit", to: "tasks#edit", as: :edit_task

  # patch "/tasks/:id", to: "tasks#update"

  # delete "/tasks/:id", to: "tasks#destroy"
end

# get "/tasks/:id", to: "tasks#show", as: :task

# get: This is a method provided by Rails that defines a route for handling HTTP GET requests.

# "/tasks/:id": This specifies the URL pattern for the route. It represents a dynamic segment :id in the URL,
# which can match any value. For example, /tasks/1 or /tasks/42.

# to: "tasks#show": This indicates that the route should be handled by the show action of the TasksController.

# as: :task: This assigns a name (or prefix) to the route. In this case, the route is named task.
# This allows you to use named route helpers, such as task_path, to generate the URL for this route.
# For example, task_path(1) would generate the URL /tasks/1 and task_path(42) would generate /tasks/42.
