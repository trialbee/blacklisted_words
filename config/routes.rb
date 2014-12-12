Rails.application.routes.draw do
  get 'validate/validate_string'
  root 'validate#validate_string'
end
