$(function() {
   $('.js-next').click(function(e) {
      var nextId = parseInt($('.js-next').attr('data-id')) + 1;
      url = this.href
      $.getJSON(url + nextId, function(data) {
         
         idArray = $('.select')
         for (let i = 0; i < idArray.length; i++) {
            idName = $(idArray[i].id).selector
            if (!!idArray[i].href) {
               $('a#edit_button').attr('href', `/insulation_types/${nextId}/edit`);
               $('a#delete_button').attr('href', `/insulation_types/${nextId}`);
            } else {
               $(`#${idName}`).text(data[idName]);                  
            }
         }
         
         if(data.quotes) {
            $('.related_quotes').html('')
            for (let i = 0; i < data.quotes.length; i++) {
               const quote = data.quotes[i];
               $('.related_quotes').append(`<li>Quote Id: ${quote.id} | Customer Name: ${quote.customer_name}</li>`)
            }
         }
         
         $('.js-next').attr('data-id', data['id'])       
      })
      e.preventDefault()
   })
})