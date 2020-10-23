// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function d_add(arr, element){
	if(!contains(arr,element)){
		for (var i=0;i<array_length_1d(arr); i++){
			if(arr[i]!=""){
				arr[@i]=element;
				return true;
				}
		}
	return false;
}
}