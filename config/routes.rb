Rails.application.routes.draw do

  get 'new-session/:token' => "session#token", as: :new_session

  root to: 'emails#index'

  resources :emails do
    get 'render_html', on: :member
    get 'render_preview', on: :member
    post 'archive', on: :member
    post 'unarchive', on: :member

    get 'archived', on: :collection
    post 'live_preview', on: :collection
  end

  get 'export/:token' => 'export#token', as: :token_export

  resources :templates

end
