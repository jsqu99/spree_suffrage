module Spree
  module Admin
    class PollsController < ResourceController

      def index
        session[:return_to] = request.url
        respond_with(@collection)
      end

      def show
        session[:return_to] ||= request.referer
        redirect_to( :action => :edit )
      end

      private
        def collection
          return @collection if @collection.present?
          params[:q] ||= {}

          params[:q][:s] ||= "name asc"

          @search = super.ransack(params[:q])

          @collection = @search.result.
            page(params[:page]).
            per(Spree::Suffrage::Config[:admin_polls_per_page])
          @collection
        end
    end
  end
end
