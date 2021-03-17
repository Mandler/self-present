class Manage::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    uri = URI.parse("https://api.github.com/users/#{current_user.github_name}/repos?sort=updated&per_page=10")
    response = Net::HTTP.get_response(uri)
    @records = JSON.parse(response.body)
  end

  private

  def github_records
    return [] unless current_user&.github_name.present?
    uri = URI.parse("https://api.github.com/users/#{current_user.github_name}/repos?sort=updated&per_page=10")
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  end
end
