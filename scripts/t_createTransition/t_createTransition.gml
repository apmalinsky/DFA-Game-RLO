// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

s1_ = argument0;
sym=argument1;
s2 = argument2;
d_add(global.dfa.transitions, t_getLabel(s1_,s2,sym));   //add the transition if it doesn't exist, defined script_dfa
