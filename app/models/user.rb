class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :first_name, type: String, default: ""
  field :last_name, type: String, default: ""
  field :email, type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :mobile, type: String
  field :gender, type: String
  field :authentication_token, type: String
  field :date_of_birth, type: Date
  field :role, type: String, default: "user"

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  ## Confirmable
  field :confirmation_token, type: String
  field :confirmed_at, type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email, type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  #associations
  has_many :bookings
  has_many :comments

  #validations
  validates :first_name, :last_name, :mobile, :gender, :date_of_birth, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }, allow_blank: true
  validates :gender, :inclusion => %w(male female)
  validates :mobile, numericality: { only_integer: true }, length: { minimum: 8,  maximum: 14 }

  before_create :save_authentication_token

  #methods
  def admin?
    self.role.name == "Admin"
  end

  private
  def save_authentication_token
    self.authentication_token = generate_authentication_token
  end
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
