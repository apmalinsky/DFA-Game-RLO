// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

arr = argument0;
element = argument1;
var found=false;
for (var i=0;i<array_length_1d(arr); i++){
	if(arr[i]==element){
		found=true;
		for (var j=i;j<array_length_1d(arr)-1;j++){
			arr[@j]=arr[@j+1];
		}
		arr[@array_length_1d(arr)-1]="";
		break;
	}
}
return found;
