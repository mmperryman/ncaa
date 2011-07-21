$(function(){
  
  $("#p1").addClass('_current');
  $("#p1").show();
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
			$('._current','#results').removeClass('_current').hide();
			$('#p'+page).addClass('_current').show();
			}
	});
  
  $(':checkbox').change(function(){
    countChecked();
    handle_update_total();
  })
})

function handle_update_total(){
  $('#prev_total_wins').text("OVER 9000");
}

function countChecked() {
  var n = $("input:checked").length;
  if (n > 5)
    alert('busted');
  $("#total_teams_picked").text(n + " Teams Selected.");
}

