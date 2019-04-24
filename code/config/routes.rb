Rails.application.routes.draw do
  get 'sessions/new'
  namespace :internal do
    get 'about/index'
  end
  namespace :internal do
    get 'wishlist_items/index'
    get 'wishlist_items/new'
    get 'wishlist_items/edit'
  end
  namespace :internal do
    get 'donation_items/show'
    get 'donation_items/index'
    get 'donation_items/new'
    get 'donation_items/edit'
  end
  namespace :internal do
    get 'dashboard/index'
  end
  namespace :internal do
    get 'wishlist_item/index'
    get 'wishlist_item/new'
    get 'wishlist_item/edit'
  end
  namespace :internal do
    get 'donation_item/index'
    get 'donation_item/new'
    get 'donation_item/edit'
  end

  namespace :internal do
    resources :donation_items, :wishlist_items
  end
end
