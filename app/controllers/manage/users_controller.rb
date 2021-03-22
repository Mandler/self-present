class Manage::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @records = github_records
  end

  def update
    if current_user.update(users_params)
      redirect_to manage_user_path, notice: 'Zmiany zostały zapisane'
    else
      redirect_to manage_user_path, alert: current_user.errors.full_messages
    end
  end

  private

  def github_records
    return [] unless current_user&.github_name.present?
    uri = URI.parse("https://api.github.com/users/#{current_user.github_name}/repos?sort=updated&per_page=10")
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  rescue
    return []
  end

  def users_params
    params.require(:user).permit(:first_name, :last_name, :job_title, :github_name)
  end
end
