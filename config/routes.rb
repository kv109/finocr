Rails.application.routes.draw do

  root to: 'docs#new'

  resource :docs, only: [:new]

end
