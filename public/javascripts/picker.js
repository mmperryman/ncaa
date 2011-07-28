$(function(){
  
  $("#p1").addClass('_current');
  $("#p1").show();
  initPagination();
  handle_wins_overflow();
  
  $(':checkbox').change(function(){
    if (countChecked($(this))) {
      handle_update_total($(this));
      handle_pick_post($(this));
      handle_wins_overflow();
      }  
  })
})

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
  if ($("input:checked").length > 5) 
    el.attr('checked', false);
  else {
    el.closest('.result').effect('highlight', 500);
    $("#total_teams_picked").text($("input:checked").length + " Teams Selected.");
    return true;
    }
}

function initPagination() {
  $("#page_maker").paginate({
		count: 5,
		start: 1,
		display: 3,
		border: false,
		text_color: '#79B5E3',
		background_color: 'white',	
		text_hover_color: '#2573AF',
		background_hover_color: '#F0F0F0', 
		images: false,
		mouse: 'press',
		onChange: function(page){
		  var current_page = $('._current')[0].id.split('p')[1]
      if (page == current_page)
        return false;
			$('._current','#results').removeClass('_current').hide("slow");
			$('#p'+page).addClass('_current').show("slow");
			}
	});
}
