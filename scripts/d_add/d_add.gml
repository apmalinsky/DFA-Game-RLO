// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

arr = argument0;
element = argument1;
if(!d_contains(arr,element)){
	for (var i=0;i<array_length_1d(arr); i++){
		if(arr[i]!=""){
			arr[@i]=element;
			return true;
			}
	}
return false;
}
