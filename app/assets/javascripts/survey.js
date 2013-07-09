function setSaveButton()
		{
			$('#profile').submit(function() 
			{  
				var valuesToSubmit = $(this).serialize();
				$.post(
					{
						url: $(this).attr('action'), 
						data: valuesToSubmit,
						dataType: "html",
					}
				);
				return false; 
			});
		}		

		$(document).ready(function() 
		{
			/* timer */
			if (typeof localStorage['count'] != 'undefined')
			{
				var count = parseFloat(localStorage['count']);
			}
			else
			{
				var count = parseFloat("0.0");
			}

			var flag = 0;

			var interval = setInterval(function() 
			{
				count = count + 0.1;
				flag += 1;
				if (flag % 10 == 0)
				{
					time_to_display = (360.0-count).toString().substring(0,5)+"";
					flag = 0;
				}
				else
				{
					time_to_display = (360.0-count).toString().substring(0,5);
				}
				$('#timer_seconds').html(time_to_display);
				localStorage['count'] = count;
			}, 
			100);

			var timeout = setTimeout(function() 
			{
				clearInterval(interval);
				count = 0;
				localStorage["count"] = 0;
			}, 
			360000 - count);

			/* main functionality */
			{
				switch(localStorage['page'])
				{
					case "page1":
						$.get('users/new', function(data) 
						{
							$('#survey').html(data);
						});
						setSaveButton();
						break;

					case "page2":
						if (typeof localStorage['user_id'] != 'undefined')
						{
							arg = { id: localStorage['user_id'] };
						}
						else
						{
							arg="";
						}
						$.get('users/edit', arg, function(data) 
						{
							$('#survey').html(data);
						});
										
						setSaveButton();
						break;

					case "page3":
						$.get('users/gifbin', function(data) 
						{
							$('#survey').html(data);
						});
						$('#timer_seconds').html((360.0-count).toString().substring(0,5));
						clearInterval(interval);
						break;

					default:
						$.get('users/new', function(data) 
						{
							$('#survey').html(data);
						});
						localStorage['page'] = "page1";
						setSaveButton();
						break;
				}
			}	


			$(document).on('ajax:error', function()
			{
				alert("Проверьте, что все поля заполнены верно!");
			}
			);

			$(document).on('ajax:success', function(data, textStatus)
			{
				$('#survey').html(textStatus);
				switch(localStorage['page'])
				{
					case "page1":
						localStorage['page'] = "page2";
						localStorage['user_id'] = $(".edit_user").attr("id").replace("edit_user_","");
						break;
					case "page2":
						localStorage['page'] = "page3";
						$('#timer_seconds').html((360.0-count).toString().substring(0,5))+"";
						clearInterval(interval);
						break;
					default:
						break;
				}
			});		
		});		
