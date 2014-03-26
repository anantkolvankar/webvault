class User < ActiveRecord::Base
  simple_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :assets
  has_many :folders 
  
  has_many :childs, class_name: 'User', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'User'
 
  belongs_to :level

end