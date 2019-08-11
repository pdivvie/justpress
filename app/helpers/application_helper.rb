module ApplicationHelper
  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: root_path,
        title: 'Games'
      },
      {
        url: articles_path,
        title: 'Articles'
      },
      {
        url: root_path,
        title: 'Events'
      },
      {
        url: root_path,
        title: 'Match Database'
      },
      {
        url: root_path,
        title: 'Local Player Profiles'
      }
    ]
  end

  def nav_helper style, tag_type

    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
