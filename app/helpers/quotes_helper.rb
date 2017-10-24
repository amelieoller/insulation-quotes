module QuotesHelper

   def sorted_by_effective_price(application)
      effective_price(application).collect {|insulation| insulation}
   end

   def effective_price(application)
      application.insulation_types.sort_by do |insulation|
         price = (insulation.width / application.oc.to_f) * (application.length * application.height) * (insulation.price / insulation.coverage)
         price
      end
   end

end