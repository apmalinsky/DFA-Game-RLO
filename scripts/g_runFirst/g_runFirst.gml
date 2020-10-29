// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function g_runFirst(){
global.strings=[];
global.num_states=0;
global.num_strings=0;
global.dfa = {
	transitions: t_initTrans(),
	states: [0],
	alphabet: [0],
	start: "s1",
	final: ""
}
}