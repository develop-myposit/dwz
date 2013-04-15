module ApplicationHelper
   def markdown(text)
   	options ={ :hard_wrap => true,
   	           :autolink => true,
   	           :no_intra_emphasis => true,
   	           :filter_html => true }
      dmarkdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
      dmarkdown.render(text).html_safe
   end
end
