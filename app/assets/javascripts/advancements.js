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
    })
  })
  // $('#req-table').on('click', '.req-date', function(event){
  //   event.preventDefault();
  //   var uri = $(this).attr('href');
  //   var id = $(this).closest('tr').attr('id');
  //   var request = $.ajax({
  //     method: "GET",
  //     url: uri
  //   })
  //   request.done(function(response){
  //     $('#req-table').find('#' + id + '-form').html(response.html);
  //     $('#' + id + '-form').removeClass('hidden');
  //   })
  // })
  //
  // $('#req-table').on('click', '.save-req-date', function (event){
  //   event.preventDefault();
  //   var uri = $(this).closest('form').attr('action');
  //   var form = $(this).parent();
  //   var id = $(this).closest('tr').attr('id').slice(0,-5);
  //   var data = form.serialize();
  //   console.log(data);
  //   console.log(id);
  //   var request = $.ajax({
  //     method: "PATCH",
  //     url: uri,
  //     data: data
  //   })
  //   request.done(function(response){
  //     console.log(response)
  //     // $('#req-table').find('#'+id).html()
  //   })
  // })
  // $('#req-table').on('click', '.cancel-req-date', function (event){
  //   event.preventDefault();
  //   var id = $(this).closest('tr').attr('id');
  //   $('#' + id).html();
  //   $('#' + id).addClass('hidden');
  // })

  // $(".rank-row").on("click", ".req-comp-edit", function(event){
  //   event.preventDefault();
  //   event.stopPropagation();
  //   var web_address = $(this).find("a").attr("href");
  //
  //   // var request = $.ajax({
  //   //   method: "GET",
  //   //   url: web_address
  //   // });
  //   // console.log(web_address)
  //   // request.done(function(response){
  //     // $('#rank-' + response.id + '-edit').html(response.html);
  //     // $('#rank-' + response.id).addClass('hidden');
  //     // $('#rank-' + response.id + '-edit').removeClass('hidden');
  //   //   console.log(response.id)
  //   // })
  // });
})
