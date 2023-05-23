class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to task_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end


# Don’t repeat yourself! The same line is duplicated at the beginning of several controller actions:
# @restaurant = Restaurant.find(params[:id])
# To refactor this, we move duplicated code in a before_action Rails filter...
# we created a private method called set_task


# params.require(:task).permit(:title, :details)

# params is a method in Rails that provides access to the parameters sent in the request.
# It represents the parameters received from the form or URL query parameters.

# require(:task): This method call ensures that the params hash contains a key called :task.
# It is used to enforce strong parameters and protect against mass assignment vulnerabilities.
# If the :task key is not present in the params hash, it will raise a ActionController::ParameterMissing error.

# permit(:title, :details): This method call specifies which attributes of the task object are allowed to be mass-assigned.
# It permits only the :title and :details attributes.
# This protects against unwanted or malicious data being assigned to other attributes that should not be modified through mass assignment.

# In summary, the task_params method is a private method used for strong parameter handling.
# It ensures that only the :title and :details attributes are allowed to be mass-assigned from the params hash,
# which helps prevent security vulnerabilities and ensures that only the permitted attributes are used when creating or updating a Task object.



# def destroy
#   @task.destroy
#   redirect_to task_path, status: :see_other
# end

#   @task.destroy: This line calls the destroy method on the @task object. It deletes the corresponding record from the database.

#   redirect_to task_path: This line redirects the user to a specific URL after the task is successfully destroyed.
#   In this case, task_path is used without any argument, which means it will redirect to the index page or
#   the show page of the task, depending on the context. The actual behavior will depend on how your routes are configured.

#   status: :see_other: This sets the status code of the redirect response. In this case, it is set to 303 See Other.
#   This status code indicates that the client should perform a GET request to the specified URL.
#   It is commonly used for redirection after a successful DELETE operation.
