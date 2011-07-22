$(function(){
  
  $("#p1").addClass('_current');
  $("#p1").show();
  initPagination();

  
  $(':checkbox').change(function(){
    if (countChecked($(this))) {
      handle_update_total($(this));
      }  
  })
})

function handle_update_total(el){
  var num = parseInt($(el.closest('.result').children('.wins_field')[0]).text());
  var pre = parseInt($('#prev_total_wins').text());
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
		count: 10,
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
			$('._current','#results').removeClass('_current').hide("slow");
			$('#p'+page).addClass('_current').show("slow");
			}
	});
}
