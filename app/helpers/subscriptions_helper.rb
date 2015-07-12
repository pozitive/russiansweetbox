module SubscriptionsHelper

  def user_subscription_path(current_user)
    if current_user.subscriptions.any?
      subscription_path(current_user.subscriptions.first)
    else
      root_path
    end
  end
  
end
