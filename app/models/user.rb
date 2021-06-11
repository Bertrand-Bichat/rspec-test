class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def import
    uri = 'https://jsonplaceholder.typicode.com/users'
    content = callAPI(uri)
    user = JSON.parse(content)
    user.first()["name"]
  end

  private

  def callAPI(uri)
    Net::HTTP.get(URI.parse(uri))
  end
end
