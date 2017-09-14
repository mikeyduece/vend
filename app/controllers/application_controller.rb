class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :pluralize_without_count
  def pluralize_without_count(count, noun)
    if count != 0
      count == 1 ? "#{noun}" : "#{noun.pluralize}"
    end
  end
end
