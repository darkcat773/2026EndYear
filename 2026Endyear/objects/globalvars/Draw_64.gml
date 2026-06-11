draw_set_font(pixelfont);
draw_set_color(c_white);
draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
if !enter {
	if ((current_time div 400) % 2 == 0) {
		draw_text_transformed(384, 480, "Press Enter", 2, 2, 0);
}
}
