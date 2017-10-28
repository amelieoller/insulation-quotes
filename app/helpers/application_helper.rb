module ApplicationHelper
   def formatted_date(date)
      date.strftime("%a, %e %b %Y")
   end
end
