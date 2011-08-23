$(function(){
  //stupid IE doesn't handle change events on selects with jQ live
  $('select').bind('change',
    function(){$(this).blur()}
   );
   
  init_data_table();	
  handle_wins_overflow();
  $('.team_pick').live('mouseover', function() {
	$(this).children('.win_info').show();
  })
  $('.team_pick').live('mouseout', function() {
	$(this).children('.win_info').hide();
  })

  $(':checkbox').live('change', function(){
    if (countChecked($(this))) {
      handle_update_total($(this));
      handle_pick_post($(this));
      handle_wins_overflow();
      }  
  })
})

function init_data_table() {
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
  var pick_count = $(oTable.fnGetNodes()).find("input[type='checkbox']:checked").length;
  if (pick_count > 5) {
    el.attr('checked', false);
    }
  else {
    el.closest('.result').effect('highlight', 500);
    $("#total_teams_picked").text($("input:checked").length + " Teams Selected.");
    return true;
    }
}

