class RodauthApp < Rodauth::Rails::App
  # primary configuration
  configure RodauthMain

  # secondary configuration
  # in lib/rodauth_app.rb
plugin :rodauth do
  enable :oauth_authorization_code_grant, :jwt_refresh
  # ...

  # you can also add these overrides, so that +current_oauth_account+ and
  # +current_oauth_application+ controller helpers retur active record
  # instances instead:
  jwt_access_token_period 100

  jwt_refresh_token_deadline_interval {3.minutes}

  oauth_account_ds { |id| Account.where(account_id_column => id) }
  oauth_application_ds { |id| OAuthApplication.where(oauth_applications_id_column => id) }


end
  # configure RodauthAdmin, :admin

  route do |r|
    r.rodauth # route rodauth requests

    # ==> Authenticating requests
    # Call `rodauth.require_account` for requests that you want to
    # require authentication for. For example:
    #
    # # authenticate /dashboard/* and /account/* requests
    # if r.path.start_with?("/dashboard") || r.path.start_with?("/account")
    #   rodauth.require_account
    # end

    # ==> Secondary configurations
    # r.rodauth(:admin) # route admin rodauth requests
  end
end
