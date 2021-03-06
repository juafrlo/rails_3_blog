module PostsHelper
  def post_title(post)
    post_page? ? post.title : link_to(post.title,post)
  end
  
  def date_block(date) 
    html = "<div class='dateblock'>"
      html +=  "<span class='dateblock_mon'>#{l(date, :format => :month)} </span>"
      html +=  "<span class='dateblock_day'>#{l(date, :format => :day)} </span>"
      html +=  "<span class='dateblock_year'>#{l(date, :format => :year)}</span>"
    html += "</div>"
    raw html
  end    

  def post_tags(post)
    html = ""
    post.tags.each do |tag|
      html += link_to(tag.name, tag_path(tag))
      html += ", " unless tag == post.tags.last
    end
    raw html
  end
  
  def delete_post(post)
  	content_tag :div, :class => 'destroy_link' do 
  		link_to t('.delete_post'), post, :method => :delete, :confirm => t('.are_you_sure')
    end if admin? && action_name != 'index'
  end
  
  def edit_post(post)
  		link_to t('.edit_post'), edit_post_path(post)
  end

  def admin_links(post)
    content_tag :div, :class => 'destroy_link' do 
  		link_to(t('.delete_post'), post, :method => :delete, :confirm => t('.are_you_sure')) +
  		" | " +  
  		link_to(t('.edit_post'), edit_post_path(post))
    end if admin? && action_name != 'index'
  end
  
  def tag_h1
    if tag_page?
    	html = "<div id='nofloat'>"
    		html += "<h1>#{t('.posts_tagged_with')} #{@tag.name}:</h1>"
    	html += "</div>"
    	html +="<br/>"
    end   
    raw html 
  end
end
