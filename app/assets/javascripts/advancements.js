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
  $("#req-table").on("click", "a.update-requirement", function(event){
    event.preventDefault();
    var web_address = $(this).attr("href");
    console.log(web_address)
    // var request = $.ajax({
    //   method: "GET",
    //   url: web_address
    // });
    // request.done(function(response){
    //   console.log("done")
    //   console.log(response.id)
    //   // parent.after(response.html);
    //   // $('#req-table').append(response.html);
    // })
  });
})
