class User < ActiveRecord::Base
  simple_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :assets, :dependent => :destroy
  has_many :folders, :dependent => :destroy
  
  has_many :childs, class_name: 'User', foreign_key: 'parent_id', :dependent => :destroy
  belongs_to :parent, class_name: 'User'
 
  belongs_to :level

end