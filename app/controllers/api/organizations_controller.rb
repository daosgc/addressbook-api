class Api::OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end
end
