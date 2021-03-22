class PresentationController < ApplicationController
  def index
    @users = User.all.limit(10)
  end

  def show
    @user = User.find(params[:id])
    @github_records = github_records(params[:id])
  end

  private

  def github_records(user_id)
    user = User.find(user_id)
    return [] unless user&.github_name.present? || user.nil?
    uri = URI.parse("https://api.github.com/users/#{user.github_name}/repos?sort=updated&per_page=10")
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  rescue
    return []
  end
end