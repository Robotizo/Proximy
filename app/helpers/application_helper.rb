module ApplicationHelper

	def show_photo(size)
    	Unsplash::Photo.find("tAKXap853rY")[:urls][size.to_sym]
  	end

  	
	def avatar_for(user)
	    @avatar = user.avatar
	    unless @avatar.present?
	        @avatar_user = image_tag("profile.jpg", alt: user.name, class: "userImage1")
	    end
	    return @avatar_user
	end


	def image_for(user)
	    @image = user.image
	    unless @image.present?
	        @image_user = image_tag("cover.jpg", alt: user.name, class: "userImageCover")
	    end
	    return @image_user
	end

	def avatarNav_for(user)
	    @avatar = user.avatar
	    unless @avatar.present?
	        @avatar_user = image_tag("profile.jpg", alt: user.name, class: "userImageNav")
	    end
	    return @avatar_user
	end

	def avatarFront_for(user)
	    @avatar = user.avatar
	    unless @avatar.present?
	        @avatar_user = image_tag("profile.jpg", alt: user.name, class: "userImg")
	    end
	    return @avatar_user
	end


	def avatarDiscover_for(user)
	    @avatar = user.avatar
	    unless @avatar.present?
	        @avatar_user = image_tag("profile.jpg", alt: user.name, class: "userImgDisc")
	    end
	    return @avatar_user
	end
end
