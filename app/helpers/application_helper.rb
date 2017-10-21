module ApplicationHelper

   def logged_in?
      !!current_user  
   end

   def delete_path(type, model)
      send("#{model}_path", type)
   end

   def edit_path(type, model)
      send("edit_#{model}_path", type)
   end

end
