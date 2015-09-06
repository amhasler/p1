module ApplicationHelper
	def render_title
	  return @title if defined?(@title)
	  "Page One"
	end


  def happy_date(min_date, max_date, circa)
  	total = ""
  	if circa
  		total = "circa "
  	end
  	if min_date < 0
  		date = min_date*-1
  		total = total + date.to_s + "BCE"
  	else
  		total = total + min_date.to_s 
  	end
  	if max_date
  		if max_date < 0
  			date = max_date*-1
  			total = total + " - " + date.to_s  + "BCE"
  		else
  			total = total + " - " + max_date.to_s 
  		end
  	end
    return total
  end
end
