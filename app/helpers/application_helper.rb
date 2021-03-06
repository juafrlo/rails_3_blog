module ApplicationHelper
  
  def textilize(text)
    Textilizer.new(text).to_html unless text.blank?
  end

  def tab_class(section)
    case section
      when "posts"
        {:class => 'selected'} if controller_name == section && action_name != 'new'
      when "new_post"
        {:class => 'selected'} if controller_name == "posts" && action_name == 'new'
      when "contacts"
        {:class => 'selected'} if controller_name == section && action_name != 'new'
    end
  end

  def flash_message
    if !flash[:notice].blank? 
      raw "<div class='message ok'>" + flash[:notice] + "</div>" 
    elsif !flash[:error].blank?
      raw "<div class='message error'>" + flash[:error] + "</div>"
    end
  end
  
  def page_title
    title = if post_page?
      @post.title
    elsif controller_name == "contacts" && action_name == "index"
      t(".contact")
    elsif tag_page?
      "Tags - #{params[:id]}"
    elsif !params[:page].blank?
      "#{SITE_NAME} - #{t('.Posts_index')} - #{t('.Page')} #{params[:page]}"
    else
      SITE_NAME
    end
    title.include?(SITE_NAME) ? title : "#{title} - #{SITE_NAME}"
  end
  
  def page_description
    if post_page?
      @post.intro.to_s[0..299].gsub(/<a href=\".+\">/,'').gsub(/<\/a>/,'')
    elsif controller_name == "contacts" && action_name == "index"
      "#{t('.contact_intro')} #{t('.how_to_contact')}"  
    elsif tag_page?
      "#{t('.posts_by_tag')} #{params[:id]}"
    elsif !params[:page].blank?
      "#{DESCRIPTION}. #{t('.Posts_index')}. #{t('.Page')} #{params[:page]}"
    else 
      DESCRIPTION
    end
  end
  
  def homepage?
    controller_name == 'posts' && action_name == 'index'
  end  
  
  def post_page?
    controller_name == "posts" && action_name == "show"
  end
  
  def tag_page?
    controller_name == "tags" && action_name == "show"
  end
  
  def list_page?
    homepage? || tag_page?
  end
  
  def home_path
    '/'
  end  

  def home_url
    "http://#{request.host}"
  end  
end