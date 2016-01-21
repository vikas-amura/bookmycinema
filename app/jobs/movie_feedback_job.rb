class MovieFeedbackJob < ActiveJob::Base
  queue_as :default

  def perform(booking_id)
     MovieFeedback.movie_feedback(booking_id).deliver
  end
end
