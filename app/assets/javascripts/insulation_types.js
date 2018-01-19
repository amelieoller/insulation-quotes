$(function() {
   $('.js-next').click(function(e) {
      var nextId = parseInt($('.js-next').attr('data-id')) + 1;
      url = this.href
      $.getJSON(url + nextId, function(data) {
         
         idArray = $('.select');
         for (var i = 0; i < idArray.length; i++) {
            idName = $(idArray[i].id).selector;
            button = $(idArray[i]).attr('href');

            if (button) {
               var new_button = button.replace(/\d+/g, nextId);            
               $(idArray[i]).attr('href', new_button);
            } else {
               $(`#${idName}`).text(data[idName]);                  
            }
         }
         
         if(data.quotes) {
            $('.related_quotes').html('')
            for (var i = 0; i < data.quotes.length; i++) {
               const quote = data.quotes[i];
               $('.related_quotes').append(`<li>Quote Id: ${quote.id} | Customer Name: ${quote.customer_name}</li>`)
            }
         }
         
         $('.js-next').attr('data-id', data['id'])       
      })
      e.preventDefault()
   })
})