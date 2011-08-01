$(function(){
  
  // $("#p1").addClass('_current');
  // $("#p1").show();
  // initPagination();
  oTable = $('#picker').dataTable({
    "aaSorting": [ [0,'desc'] ],
		"bJQueryUI": true,
		"sPaginationType": "two_button",
		"aoColumns":                                                       
      [                                                                  
      { "bSortable": false},
      { "bSortable": true},
      { "bSortable": false},
      { "bSortable": true}
      ]
	});
	
  handle_wins_overflow();
  
  $(':checkbox').change(function(){
    if (countChecked($(this))) {
      handle_update_total($(this));
      handle_pick_post($(this));
      handle_wins_overflow();
	  handle_update_user_picks();
      }  
  })
})

function handle_update_user_picks(){
  var url = '/picks/update_picks';
  $.get(url, function(data) {})
}
function handle_wins_overflow(){
  if (parseInt($('#prev_total_wins').text()) > 40) 
    $('#wins_overflow').slideDown('fast')
  else
    $('#wins_overflow').hide('fast')
}

function handle_pick_post(el){
  var params =
      {
        team_id: el[0].id.split('team_')[1],
        _destroy: (el.attr('checked')) ? 'false' : 'true'
      }
  var url = '/picks'    
  $.post(url, params, function(data) {})
}

function handle_update_total(el){
  var num = parseInt($(el.closest('.result').children('.wins_field')[0]).text());
  var pre = parseInt($('#prev_total_wins').text());
   $('#total_teams_picked').effect('highlight', 500);
   $('#prev_total_wins').effect('highlight', 500); 
  if (el.attr('checked'))
    $('#prev_total_wins').text(pre + num);
  else
    $('#prev_total_wins').text(pre - num);
  
}

function countChecked(el) {
  if ($("input:checked").length > 5) {
    el.attr('checked', false);
    }
  else {
    el.closest('.result').effect('highlight', 500);
    $("#total_teams_picked").text($("input:checked").length + " Teams Selected.");
    return true;
    }
}

