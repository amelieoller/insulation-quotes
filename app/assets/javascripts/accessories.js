function Accessory(attributes) {
   this.name = attributes.name;
   this.id = attributes.id;
}

Accessory.success = function(json){
   $('#accessory_name').val("");
   
   var accessory = new Accessory(json);
   var accessoryLI = accessory.renderLI();
   
   $('ul#accessory_list').append(accessoryLI);
}

Accessory.error = function(response){
   alert('Looks like this Item already exists');
}

Accessory.formSubmit = function(e) {
   e.preventDefault();
   
   var $form = $(this);
   var action = $form.attr('action');
   var params = $form.serialize();

   $.ajax({
      url: action,
      data: params,
      dataType: 'json',
      method: 'POST'
   })
   .success(Accessory.success)
   .error(Accessory.error)
}

Accessory.formSumbitListener = function() {
   $('#new_accessory').on('submit', Accessory.formSubmit);
}

Accessory.ready = function() {
   Accessory.source = $('#accessory-template').html();
   Accessory.template = Handlebars.compile(Accessory.source);
   Accessory.formSumbitListener()
}

Accessory.prototype.renderLI = function() {
   return Accessory.template(this);
}

$(function(){
   if (!!$('#accessory-template').length) {
      Accessory.ready()
   }
})