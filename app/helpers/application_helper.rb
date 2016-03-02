module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "the Library"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  def profile_page_heading(heading='')
    profile_heading='Profile'
    if heading.empty?
      profile_heading
    else
      profile_heading + ": " + heading
    end
  end
end
