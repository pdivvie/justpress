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
        url: topic_path(1),
        title: 'Articles'
      },
      {
        url: topic_path(2),
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

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
