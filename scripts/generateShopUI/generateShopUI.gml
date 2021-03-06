function generateShopUI(){
	log("generating shop ui...");
	global.MenuCursor.draw = method(undefined, function() {
		surface_set_target(global.surfaces.HUD);
		draw_set_color(c_white);
		//draw_rectangle(x,y,x+width,y+height,true);
		draw_sprite_ext(s_itemselector,0,x,y,(width+6)/32,(height+6)/32,0,c_white,1);
		//
		
		surface_reset_target();
	
	});
	var funny = makeGenericElement(0, 0, 0, 0, s_null);
	funny.draw = munction(function() {
		//surface_reset_target();
		surface_set_target(global.surfaces.HUD);
		draw_set_color(c_white);
		//surface_set_target(global.surfaces)
		draw_sprite(s_shopbg, 0, 0, 0);
		draw_sprite(s_shopbg, 1, 0, 0);
		if variable_struct_exists(global.MenuCursor.target, "itemID") {
			//draw_sprite(global.MenuCursor.target.itemsprite, 0, 40, 270);
			draw_sprite(c_getitembyid(global.MenuCursor.target.itemID).sprite, 0, 50, 260);
			draw_set_halign(fa_center);
			draw_text(50, 295, c_getitembyid(global.MenuCursor.target.itemID).quality);
			draw_set_halign(fa_left);
		}
		draw_text_ext(80, 225, global.title, 10, 190);
		draw_text_ext(80, 240, global.tooltip, 10, 190);
		draw_text_ext(80, 255, global.description, 10, 190);
		
		//draw_text_ext(100, 220+irandom(20), irandom(50), 10, 200);
		draw_set_halign(fa_center);
		draw_text(260, 40, "credit:\n" + string(global.credit));
		draw_set_halign(fa_left);
		//draw_sprite(c_getitembyid(global.MenuCursor.target.itemID).sprite, 0, 50, 50);
		//surface_set_target(global.surfaces.HUD);
		surface_reset_target();
	});
	funny.options.selectable = false;
	
	var itemposlist = array_create(SHOPPOSITION.SIZE);
	for(var i = 0; i < array_length(o_shopmanager.inventory); i++){
		switch o_shopmanager.inventory[i].position {
			case SHOPPOSITION.TABLE:
				makeShopUIElement(
					290+(itemposlist[SHOPPOSITION.TABLE]%3)*36-floor(itemposlist[SHOPPOSITION.TABLE]/3)*10,
					185-floor(itemposlist[SHOPPOSITION.TABLE]/3)*10,
					o_shopmanager.inventory[i].item, i,floor(itemposlist[SHOPPOSITION.TABLE]/3)
				);
				break;
			case SHOPPOSITION.BIGSHELF:
				makeShopUIElement(
					310+(itemposlist[SHOPPOSITION.BIGSHELF]%2)*36-floor(itemposlist[SHOPPOSITION.BIGSHELF]/2)*10,
					130-floor(itemposlist[SHOPPOSITION.BIGSHELF]/2)*10,
					o_shopmanager.inventory[i].item, i,floor(itemposlist[SHOPPOSITION.BIGSHELF]/2)
				);
				break;
			case SHOPPOSITION.TINYSHELF:
				makeShopUIElement(
					390-itemposlist[SHOPPOSITION.TINYSHELF]*10,
					160-itemposlist[SHOPPOSITION.TINYSHELF]*10,
					o_shopmanager.inventory[i].item, i, itemposlist[SHOPPOSITION.TINYSHELF]
				);
				break;
		}
		itemposlist[o_shopmanager.inventory[i].position]++
		
	}
}