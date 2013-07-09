class User
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  #Validation
  validates_presence_of :first_name, :last_name, :email, :birthday, :shoesize

  after_initialize do
    self.icecream = ""
    self.superhero = ""
    self.moviestar = ""
    self.world_end = ""
    self.superbowl = ""
    puts self.attributes
  end

  before_update do
    puts self.attributes    
  end 

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