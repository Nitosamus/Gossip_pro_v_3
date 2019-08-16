class ApplicationController < ActionController::Base
	add_flash_types :sucess, :danger
	protect_from_forgery with: :null_session
	include SessionsHelper
end
