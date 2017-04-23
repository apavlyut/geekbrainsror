module ApplicationHelper
  def description_name
    if logged_in?
      'Description TRUE'
    else
      'Description FALSE'
    end
  end
end
