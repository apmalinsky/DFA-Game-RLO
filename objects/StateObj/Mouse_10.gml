

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

//create all possible transitions and set invisible at beginning?

//how to remove transition?



if (global.is_state_selected){
	//draw transparent arrow connecting the selected state to this one
	//global.saved_transition_instance = {}; //save the drawn arrow for the case
    //create smooth curve path, save list of points?
	
	
	//draw transition arrow between
	//global.state_selected --> self.id
	

	
	//show_debug_message(TransitionObj)
	
	
	//var transition;
	//transition = instance_create(500, 500, TransitionObj);
	//var transitionObj = TransitionObj;
	show_debug_message("entered")
	
	//var arrow;

	//var arrow = instance_create(600, 600, StateObj);
	global.saved_transition_instance = instance_create_depth(global.state_selected.x, global.state_selected.y, 0, TransitionObj);
	
	
    //draw_sprite_ext( sprite, subimg, x, y, xscale, yscale, rot, colour, alpha );
	//var arrow_sprite = object_get_sprite(arrow);
	//draw_sprite_ext(arrow_sprite, 0, global.state_selected.x, global.state_selected.y, 1, 1, 90, global.red, 0.5)
	
	




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
}












//reset alpha
//draw_set_alpha(1.0);