class Api::OrganizationContactsController < ApplicationController
  before_action :authenticate_api_user!, only: [:create, :index, :update]

  def organization_id
    params[:organization_id]
  end

  def contact_id
    params[:id]
  end

  def create
    authorize organization_id, :authorize?
    contact = { :name => params[:name], :telephone => params[:telephone] }
    response = firebase.push('Contacts_' + organization_id, contact)
    if response.success?
      render json: contact, status: :created
    else
      render json: response.body, status: :unprocessable_entity
    end
  end

  def index
    authorize organization_id, :authorize?
    response = firebase.get('Contacts_' + organization_id)
    if response.success?
      render json: response.body, status: :created
    else
      render json: response.body, status: :unprocessable_entity
    end
  end

  def update
    authorize organization_id, :authorize?
    response_contact = firebase.get('Contacts_' + organization_id + '/' + contact_id)
    contact = response_contact.body
    contact_modified = {
      :name => params[:name] || contact['name'],
      :telephone => params[:telephone] || contact['telephone'],
    }
    response = firebase.update('Contacts_' + organization_id + '/' + contact_id, contact_modified)
    if response.success?
      render json: response.body, status: :created
    else
      render json: response.body, status: :unprocessable_entity
    end
  end

  private
  def firebase
    base_uri = Rails.application.credentials[:FIREBASE_URL]
    Firebase::Client.new(base_uri)
  end

  def pundit_user
    current_api_user
  end
end
