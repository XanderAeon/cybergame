function st_charselect() {
	c_input();
	pos = clamp(pos+rightp-leftp, 0, array_length(guys)-1);
	lerper = lerp(lerper, pos, .1);

	if select {
		/*switch pos {//im sorry cant get key by value :[
			case 0:
				global.character = "reimu";
				break;
			case 1:
				global.character = "undertale";
				break;
		}*/
		global.character = charnames[pos];
		//instance_create(0, 0, o_doors);
		state = st_dataselect;
		drawstate = st_datadraw;
		io_clear();
	}
	if back room_goto(TITLE);
}