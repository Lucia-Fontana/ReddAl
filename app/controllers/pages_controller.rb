# This class is used in order to allow guests visualize the home page

class PagesController < ApplicationController
  # Authentication is mandatory after visiting the home page
  skip_before_action :authenticate_user!, only: [:home]
end
