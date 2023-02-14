# Only run this in production
return unless Rails.env.production?

# Skip when building the docker image
return if Figaro.env.building_docker_image

# Skip then notifier is not enabled
return unless Figaro.env.enable_exception_notifier

IGNORED_EXCEPTIONS = [
  'ActionController::BadRequest',
  'ActionController::InvalidAuthenticityToken',
  'ActionDispatch::Http::MimeNegotiation::InvalidType',
  'ActionController::UnknownHttpMethod'
].freeze

# Otherwise, setup the exception notifier
Rails.application.config.middleware.use ExceptionNotification::Rack,
                                        ignore_exceptions: IGNORED_EXCEPTIONS + ExceptionNotifier.ignored_exceptions,
                                        email:             {
                                          email_prefix:         '[EXCEPTION NOTIFICATION] ',
                                          sender_address:       "notifier@#{Figaro.env.application_domain!}",
                                          exception_recipients: Figaro.env.exception_notifier_recipient
                                        }
