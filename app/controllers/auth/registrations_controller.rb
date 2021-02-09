module Auth
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :force_json

    protected

    def render_create_success
      create_employe!
      @success = true
      render 'api/auth/sessions/user'
    end

    private

    def force_json
      request.format = :json
    end

    def create_employe!
      organization = Organization.find_by(id: params[:organization_id])
      employee = Employee.create(
        organization: organization,
        user: current_api_user
      )
      employee.save
    end
  end
end
