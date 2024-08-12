class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :log_creation
  
  # Association for tasks
  has_many :tasks

  private
  def log_creation
    puts "Created a user"
  end
  
end
