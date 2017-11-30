$(function() {
   $('.js-next').click(function(e) {
      var nextId = parseInt($('.js-next').attr('data-id')) + 1;
      $.getJSON('/insulation_types/' + nextId, function(data) {
         $('#Name').text(data['name']);
         $('#Descirption').text(data['description']);         
         $('#Coverage').text(data['coverage']);
         $('#R-Value').text(data['r_value']);
         $('#Thickness').text(data['thickness']);
         $('#Width').text(data['width']);
         $('#Facing').text(data['facing']);
         $('#Price').text(data['price']);  
         $('.js-next').attr('data-id', data['id'])       
      })
      e.preventDefault()
   })
})