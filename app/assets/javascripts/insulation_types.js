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
         
         $('.js-next').attr('data-id', data['id'])       
      })
      e.preventDefault()
   })
})