class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentUserConcern
  include DeviseWhitelistConcern
  include SetSourceConcern

end