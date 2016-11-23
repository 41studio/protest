class Users::OmniauthCallbacksController < DeviseController
  before_action :authenticate_user!
  before_action :set_github

  def sync_with_github
    authorize_url = @github.authorize_url redirect_uri: Rails.application.secrets.github_callback
    redirect_to authorize_url
  end

  def callback
    oauth = @github.get_token(params[:code])
    current_user.update_attribute("oauth_token", oauth.token)
    redirect_to root_url, notice: "Thanks.. now your account has been connected with github"
  end


  private

  def set_github
    @github = Github.new client_id: Rails.application.secrets.client_id, client_secret: Rails.application.secrets.client_secret
  end
end
