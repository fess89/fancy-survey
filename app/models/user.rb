class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  #Validation
  validates_presence_of :first_name, :last_name, :email, :birthday, :shoesize
  validates_presence_of :icecream, :superhero, :moviestar, :world_end, :superbowl, :on => :update

  attr_accessible :first_name, :last_name, :email, :birthday, :shoesize 
  attr_accessible :icecream, :superhero, :moviestar, :world_end, :superbowl

   
  #Registration
  field :first_name,  :type => String
  field :last_name,   :type => String
  field :email,       :type => String
  field :birthday,    :type => DateTime
  field :shoesize,    :type => Integer
   
  #Step 2 (answering)
  field :icecream,    :type => String
  field :superhero,   :type => String
  field :moviestar,   :type => String
  field :world_end,   :type => DateTime
  field :superbowl,   :type => String  
  
end