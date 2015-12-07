class FixturesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

      def create
        secure_post = params.require(:fixture).permit(:content)
        @fixture = current_user.fixtures.build(secure_post) 
        if @fixture.save
          flash[:success] = "Fixture created!"
          redirect_to root_url
        else
          @feed_items = [] 
          render 'static_pages/home'
        end
      end

     def destroy
            @fixture.destroy
            redirect_to root_url
          end

          private

            def correct_user
              @fixture = current_user.fixtures.find_by(id: params[:id])
              redirect_to root_url if @fixture.nil?
            end
        end