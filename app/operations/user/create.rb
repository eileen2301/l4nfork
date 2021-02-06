module Operations::User
  class Create < RailsOps::Operation::Model::Create
    schema do
      opt :user do
        opt :email
        opt :password
        opt :password_confirmation
      end
    end

    without_authorization

    model ::User

    def perform
      super
      UserMailer.with(user: model).confirm_signup.deliver_now
    end
  end
end
