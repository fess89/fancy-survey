class Response
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  
  #Validation
  validates_presence_of :icecream, :superhero, :moviestar, :world_end, :superbowl
  
  #Step 2 (answering)
  field :icecream,    :type => String
  field :superhero,   :type => String
  field :moviestar,   :type => String
  field :world_end,   :type => DateTime
  field :superbowl,   :type => String  
  
end