module Spree
  class PollVote < ActiveRecord::Base
    belongs_to :user
    belongs_to :poll_answer
    delegate :poll, to: :poll_answer

    validates :poll_answer_id, :ip_address, presence: true

    # disallow multiple votes from same person/ip per poll (via poll_answer)
    validate :one_vote_per_person

    private
      def one_vote_per_person
        arel = PollVote.arel_table

        if PollVote.where(poll_answer_id: poll_answer_id).
                    where(arel[:user_id].eq(user_id).
                          or(arel[:ip_address].eq(ip_address))).exists?
          errors.add(:base, "can't vote more than once")
        end
      end
  end
end
