class AuthorsController < ApplicationController
    def index
        @authors = Author.all  
    end

    def show
        @author = Author.find(params[:id]) 
    end
    
    def new 
        @author= Author.new
    end

    def create 
        @author = Author.new(authors_params)

        if @author.save
            redirect_to @author, notice: 'Success!'
        else
            render "new"
        end 
    end
    

    private 
        def authors_params
            params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
