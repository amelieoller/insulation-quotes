$(function() {
   $("span#moreInsulation").hide();
   $("input#moreInsulationLink").click(function(event) {
         event.preventDefault();
         $("span#moreInsulation").toggle();
   });
})

function change() {
    var elem = document.getElementById("moreInsulationLink");
    if (elem.value=="More") elem.value = "Less";
    else elem.value = "More";
}

$(function(){

    $('a#view-accessories').click(function(e) {
        $('div#accessories ul').html('');
        $.getJSON(this.href).success(function(data){
            data.accessories.forEach(element => {
                $ul = $('div#accessories ul');
                $ul.append(`${element.name} | `);
            });            
        })
        e.preventDefault();
    });

})