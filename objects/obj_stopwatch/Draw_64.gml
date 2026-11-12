var text = string_format(hours, 2, 0) + ":" + string_format(minutes, 2, 0) + ":" + string_format(seconds, 2, 0)
text = string_replace_all(text, " ", "0");

draw_text(room_width/2, 50,text)