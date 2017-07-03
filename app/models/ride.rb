class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride	
	# if (user.tickets >= attraction.tickets) && (user.height >= attraction.min_height)
	#   	user.tickets -= attraction.tickets
	#   	user.happiness += attraction.happiness_rating
	#   	user.nausea += attraction.nausea_rating
	#   	user.save  
	# elsif (user.tickets < attraction.tickets) && (user.height < attraction.min_height)
 #      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
	# elsif user.tickets < attraction.tickets
	# 	"Sorry. You do not have enough tickets to ride the #{attraction.name}."
	# elsif user.height < attraction.min_height
	#   return "Sorry. You are not tall enough to ride the #{attraction.name}."
	# end

	enough_tickets, tall_enough	= meet_requirments
	if enough_tickets && tall_enough
	  start_ride
	elsif tall_enough && !enough_tickets
		"Sorry. " + ticket_issue
	elsif enough_tickets && !tall_enough
		"Sorry. " + height_issue
	else
		"Sorry. " + ticket_issue + " " + height_issue
	end
												
  end
  

  def meet_requirments
    enough_tickets, tall_enough = false
    if self.user.tickets >= self.attraction.tickets
    	enough_tickets = true
    end
    if self.user.height >= self.attraction.min_height
    	tall_enough = true
    end
    return [enough_tickets, tall_enough]
  end

  def start_ride
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets = self.user.tickets - self.attraction.tickets
    self.user.update(
		:happiness => new_happiness,
	    :nausea => new_nausea,
	    :tickets => new_tickets
    )
    "Thanks for riding the #{self.attraction.name}!"
  end

  def ticket_issue
  	"You do not have enough tickets to ride the #{self.attraction.name}."
  end

  def height_issue
  	"You are not tall enough to ride the #{self.attraction.name}."
  end

end