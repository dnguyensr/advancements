// $(document).ready(function(){
$(document).on('turbolinks:load', function(){
  $("#rank-nav").on("click", ".rank-tab", function(event){
    event.preventDefault();

    var web_address = $(this).attr("href");
    var request = $.ajax({
      method: "GET",
      url: web_address
    });
    request.done(function(response){
      $('#req-table').html(response.html);
      $(".rank-row").on("click", ".req-comp-edit", function(event){
        event.preventDefault();
      });
    })
  })
  $(".rank-row").on("click", ".req-comp-edit", function(event){
    event.preventDefault();
  });
})
