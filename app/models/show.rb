class Show
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :starttime, type: DateTime
  field :endtime, type: DateTime

  #associations
  belongs_to :screen
  belongs_to :movie
  belongs_to :theatre
  has_many :bookings
  has_many :tickets

  #validations
  validates :starttime, :endtime, presence: true
  validate :starttime_cannot_be_in_the_past,on: :create
  validate :check_for_existing?,on: :create

  def starttime_cannot_be_in_the_past
    if starttime.present? && starttime < DateTime.now
      errors.add(:starttime, "can't be in the past")
    end
  end

  private
  def check_for_existing?
    options = {}
    if self.movie_id.present?
      options['movie_id']=self.movie_id
      if self.starttime.present?
        options['starttime']=self.starttime
        if self.screen_id.present?
          options['screen_id']=self.screen_id
          show = Show.where(options)#'movie_id' => options[:movie_id],'screen_id' => options[:screen_id],'starttime' => options[:starttime]).first
        end
      end
    end
    if show.count > 0
      self.errors.add :base, " Show already exists"
    end
  end
end
