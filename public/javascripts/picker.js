$(function(){

  $(':checkbox').change(function(){
    countChecked();
    handle_update_total();
  })
  
  
})

function handle_update_total(){
  $('#prev_total_wins').text("ssss");
}


function countChecked() {
  var n = $("input:checked").length;
  if (n > 5)
    return false;
  $("#total_teams_picked").text(n + " Teams Selected.");
}