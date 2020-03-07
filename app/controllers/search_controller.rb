class SearchController < ApplicationController

    def search
        if(params[:search_model] == "user")
            case params[:search_method]
            when "perfect_match"
                @users = User.where(name: params[:search_word])
            when "partial_match"
                @users = User.where("name LIKE?", "%#{params[:search_word]}%")
            when "forward_match"
                @users = User.where("name LIKE?", "#{params[:search_word]}%")
            when "backward_match"
                @users = User.where("name LIKE?", "%#{params[:search_word]}")
            end
        elsif(params[:search_model] == "book")
            case params[:search_method]
            when "perfect_match"
                @books = Book.where(title: params[:search_word])
            when "partial_match"
                @books = Book.where("title LIKE?", "%#{params[:search_word]}%")
            when "forward_match"
                @books = Book.where("title LIKE?", "#{params[:search_word]}%")
            when "backward_match"
                @books = Book.where("title LIKE?", "%#{params[:search_word]}")
            end
        end
    end

end
