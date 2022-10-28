class SubsController < ApplicationController
    def new
    end

    def create
        @sub = User.new(sub_params)
        if @sub.save
            login!(@sub)
            redirect_to subs_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :desciption, :user_id)
    end
end
