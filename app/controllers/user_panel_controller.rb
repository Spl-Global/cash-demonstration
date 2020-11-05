# frozen_string_literal: true

# :User Panel Controller:
class UserPanelController < ApplicationController
  load_and_authorize_resource class: false
end
