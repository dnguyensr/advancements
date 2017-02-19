$(document).ready(function(){
  $("#rank-nav").on("click", ".rank-tab", function(event){
    event.preventDefault();

    var web_address = $(this).attr("href");
    var request = $.ajax({
      method: "GET",
      url: web_address
    });
    request.done(function(response){
      $('#req-table').html(response.html);
    })
  })
})
