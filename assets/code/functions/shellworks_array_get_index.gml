var array = argument0 
var value = argument1 

for(var i = 0; i < array_length(array); i++){
    if(array[i] == value)
        return i;
}
return -1;