class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      user_gardens_path
    end
end
