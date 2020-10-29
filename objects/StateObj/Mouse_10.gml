//show_debug_message("state: " + string(id))
/*
function findP1(startPoint, endPoint){
	
	var xMid = (startPoint.x + endPoint.x) / 2
	var yMid = startPoint.y + 100; //need to change this
	
	return {x: xMid, y: yMid}
}
function calculateBezierPoint(p0, p1, p2, t, pFinal){
	//pFinal = pFinal || {};
	pFinal.x = sqr(1-t) * p0.x + 2*t*(1-t)*p1.x + t*t*p2.x;
	pFinal.y = sqr(1-t) * p0.y + 2*t*(1-t)*p1.y + t*t*p2.y;
		
	return pFinal;
}
*/


window_set_cursor(cr_drag);



function getSelectedStateObj(){
	
	//show_debug_message(global.states_info.stateA)
	switch(global.state_selected.name){
		case "stateA":
			
			return global.states_info.stateA;
			
		case "stateB":
			return global.states_info.stateB;
		
		case "stateC":
			return global.states_info.stateC;
	}
			
}

function getHoveredStateObj(selected_state_obj){
	switch(id){
		case 100022:
			
			return selected_state_obj.toA;
			
		case 100021:
			return selected_state_obj.toB;
		
		case 100023:
			return selected_state_obj.toC;
	}
			
}





function getTransitionId(){
	//return transition id between selected and entered state
	
	//selected state
	var selected_state = getSelectedStateObj()
	show_debug_message(selected_state)
	return getHoveredStateObj(selected_state);
	//transitions 100015, 100016, 100017, 100018

}










if (global.is_state_selected){
	//draw transparent arrow connecting the selected state to this one
	//global.saved_transition_instance = {}; //save the drawn arrow for the case
    //create smooth curve path, save list of points?
	
	
	//draw transition arrow between
	//global.state_selected --> self.id
	

	
	//show_debug_message(TransitionObj)
	

	show_debug_message("entered")
	
	//global.saved_transition_instance = instance_create_depth(global.state_selected.x, global.state_selected.y, 0, TransitionObj);
	
	
    //draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha );
	//var arrow_sprite = object_get_sprite(global.saved_transition_instance.object_index);
	//show_debug_message(self.bbox_right)
	//draw_sprite_ext(ArrowSpr, 0, global.state_selected.x, global.state_selected.y, 2, 2, 90, global.selected_transition_color, 0.75)
	
	//100015
	//100016
	//100017
	//100018
	//get the transition object connecting these states

	
	global.hovered_transition = getTransitionId()
	with (global.hovered_transition) {
		image_blend = global.selected_transition_color;
		visible = true
		image_alpha = 0.5;
	}


}

/*
	//make drawing transparent
	draw_set_alpha(1);
	

/*
	//make drawing transparent
	draw_set_alpha(1);
	
	var start_state_point = {x: global.state_selected.x, y: global.state_selected.y};
	var end_state_point = {x: self.x, y: self.y};
	show_debug_message(start_state_point);
	show_debug_message(end_state_point);
	
	var mid_point = findP1(start_state_point, end_state_point);
	//var xMid = (startPoint.x + endPoint.x) / 2
	//var yMid = startPoint.y + 100; //need to change this
	
	//var mid_point = {x: (start_state_point.x + end_state_point.x) / 2, y: start_state_point.y + 100}
	show_debug_message(mid_point);
	var curvePoint = calculateBezierPoint(start_state_point, mid_point, end_state_point, 0, {});
	//show_debug_message(curvePoint);
	
	//number of steps to draw curve
	step_count = 10
	for (i = 0; i <= step_count; i += 1){
		show_debug_message(curvePoint);
		t = i / step_count;
		nextCurvePoint = calculateBezierPoint(start_state_point, mid_point, end_state_point, t, curvePoint)
		draw_line(curvePoint.x, curvePoint.y, nextCurvePoint.x, nextCurvePoint.y);
		curvePoint = nextCurvePoint;
	}
	*/
//reset alpha
//draw_set_alpha(1.0);




