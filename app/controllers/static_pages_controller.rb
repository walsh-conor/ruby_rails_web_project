class StaticPagesController < ApplicationController

  def help
  end

  def about
  end

   def contact
  end
  
  def faq
  end

   def home
         if logged_in?
            @fixture  = current_user.fixtures.build
            @feed_items = current_user.feed
         end
    end

end