$(function(){
 
  var updated_order = function(){
    var data_arr = [];
    $.each($(".images"), function(index){
      $(this).attr("gallery_id", index);
      data_arr.push({id: $(this).attr("data-id"), gallery_id: index })
    });
    return data_arr;
  }
 
  $(".container").sortable({
    cursor: "move",
    stop: function(event, ui){
      var data = updated_order();
      $.ajax({
        url: "images/sort",
        type: "PUT",
        data: {"data": JSON.stringify(data)},
        success: function(msg){
          console.log("Sorted!");
        }
      });
    }
  });
 
});
