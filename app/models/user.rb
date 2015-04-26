class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "bR.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :invitations, as: :sender, class: User
  has_many :invitations, as: :recipient, class: User
  has_many :rooms, through: :invitations

  has_many :messages, as: :sender, class: User
  has_many :messages, as: :recipient, class: User
end
