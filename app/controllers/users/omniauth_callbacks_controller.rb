class Users::OmniauthCallbacksController < DeviseController
  before_action :authenticate_user!
  before_action :set_github

  def sync_with_github
    authorize_url = @github.authorize_url redirect_uri: "http://staging.lvh.me:3000/callback"
    redirect_to authorize_url
  end

  def callback
    oauth = @github.get_token(params[:code])
    current_user.update_attribute("oauth_token", oauth.token)
    redirect_to root_url, notice: "Thanks.. now your account has been connected with github"
  end


  private

  def set_github
    @github = Github.new client_id: "328268bb75621cf3584c", client_secret: "ffead9ce50f469c74f56ef21e0115b0623e4e379"
  end
end
