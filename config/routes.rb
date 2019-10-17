# frozen_string_literal: true

Rails.application.routes.draw do
  resources :teams,  only: %i[index create show]  do
    resources :members, :controller => 'teams/members'

  end


  resources :tickets


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
