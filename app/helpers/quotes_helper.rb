module QuotesHelper

   def form_group_div(a, item)
      content_tag :div, class: 'form_group' do
         a.label(item) + a.text_field(item, class: 'form-control')
      end
   end

   def form_group_select_div(a, item, db_column)
      content_tag :div, class: 'form_group' do
         a.label(item) +
         a.collection_select(item, InsulationType.all.select(db_column).distinct, db_column, db_column, {:include_blank => true}, {class: 'form-control'})
      end
   end

   def form_group_custom_select_div(a, item, select_array)
      content_tag :div, class: 'form_group' do
         a.label(item) +
         a.select(item, select_array, {:include_blank => true}, {class: 'form-control'})
      end
   end

end