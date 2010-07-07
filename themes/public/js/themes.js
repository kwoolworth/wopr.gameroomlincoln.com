/* Themes */

var themes = {
	
	run: function() {
	
		themes.loadThemeData();
		
		$('form').submit(function() {
			themes.saveDefaultTheme();
			return false;
		});
		
	},
	
	loadThemeData: function() {
		
		$('span.loading').show();
		
		$.ajax({
			url: '/themes/get',
			dataType: 'json',
			success: function(theme_data) {
				themes.fillThemeTable(theme_data);
				$('span.loading').hide();
			}
		});
		
	},
	
	fillThemeTable: function(theme_data) {
		
		var table_row = $('table tbody tr')[0];
		
		$('table tbody tr').remove();
		
		$.each(theme_data, function(index, theme) {
			
			new_row = $(table_row).clone(true);
			$('td.title a', new_row).html(theme.title)
			$('td.title a', new_row).attr('href', '/themes/' + theme.id + '/demo');
			$('td.description', new_row).html(theme.description);
			$('td.default input:radio', new_row).attr('value', theme.id);
			$('td.default input:radio', new_row).attr('checked', theme['default'] ? 'checked' : '');
			$('table tbody').append(new_row);
			
		});
		
	},
	
	saveDefaultTheme: function() {
		
		var id = $('table tbody tr td.default input:radio:checked').val()
		
		$('span.loading').show();
		
		$.ajax({
			url: '/themes/set/' + id,
			dataType: 'json',
			success: function(result) {
				$('span.loading').hide();
				location.reload(true);
			}
		});
		
	}
	
}