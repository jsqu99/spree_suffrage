module Spree
  class VotesController < Spree::StoreController
    def vote
      @vote = PollVote.new
      @vote.poll_answer_id = params[:poll_answer_id]
      @vote.user_id = current_user.try(:id)
      @vote.ip_address = request.remote_ip

      if @vote.save
        session[:vote_id] = @vote.id
        flash[:notice] = I18n.t(:thanks_for_voting)
      else
        flash[:error] = I18n.t(:problem_voting)
      end
      redirect_to(:back) 
    end
  end
end
