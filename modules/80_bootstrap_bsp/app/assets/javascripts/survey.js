function clear_option_initial(obj){
   if(new_option_regex.test(obj.value)){
			clear_option_initial.option_title = obj.value;
	    obj.value = '';
		obj.style.color = "#000";
	}
}

function set_option_initial(obj){
   if(obj.value == ''){
	    obj.value = clear_option_initial.option_title;
		obj.style.color = "#666"
	}
}


function subject_input_changed(e){
    var input_type = $("#id_input_type").val();
    var input_options = $("#" + input_type + '_type').html();
    $("#input_options").html(input_options);
}

function subject_remove_option(e){
    $(e.parentNode).remove();
}

//动态增加options
function subject_add_option(e, type)
{
      var options = $('#options');
      var count   = options.find('input[type=text]').size() + 1;
      var option = '<p>';

      if(type == 'radio') {
        option += '<input type="radio" />';
      } else if (type == 'check') {
        option += '<input type="checkbox" />';
      }
      option += '<input type="text" id="id_'+ type + '_' + count + '" name="options[]" ' +
              'value="' + new_option_name + count + '" style="color:#666;margin-left:4px;" onfocus="clear_option_initial(this);" onblur="set_option_initial(this)" />';
      option += ' ';
      option += '<a href="#" onclick="subject_remove_option(this);">' + delele_link_text + '</a>';
      option += '</p>';
      options.append(option);
      var lastOptions = $('#id_'+type + '_' + count);
      if(lastOptions){
          lastOptions.focus();
      }
}

