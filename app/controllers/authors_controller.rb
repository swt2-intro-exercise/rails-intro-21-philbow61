class AuthorsController < ApplicationController
    
    def new 
        @author= Author.new
    end

    def create 
        @author = Author.new(authors_params)
        if @author.save
            redirect_to author_path(@author), notice: 'Success!'
        else
            render "New"
        end 
    end
    def show
        @author = Author.find(params[:id]) 
    end

    private 
        def authors_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
