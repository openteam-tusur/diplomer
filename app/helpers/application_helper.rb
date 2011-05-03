module ApplicationHelper

  def step_filled_state(filled)
    filled ? "filled" : "unfilled"
  end

  def title_locale
    action = case params[:action]
      when "create" then "new"
      when "update" then "edit"
      when "destroy" then "delete"
      else params[:action]
    end
    title(t("title.#{params[:controller]}.#{action}"), true)
    t("title.#{params[:controller]}.#{action}")
  end

  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

end

