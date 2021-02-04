class Api::OrganizationsController < ApplicationController
  before_action :authenticate_api_user!, only: [:create, :update]

  def index
    @organizations = Organization.all
  end

  def create
    @organization = Organization.new(organization_params)
    authorize @organization
    if @organization.save
      render :create, status: :created
    else
      render 'errors/model_errors', status: :unprocessable_entity, locals: { errors: @organization.errors }
    end
  end

  private
  def organization_params
    params.permit(
      :business_name,
      :legal_representative,
      :economic_activity
    )
  end

  def pundit_user
    current_api_user
  end
end
