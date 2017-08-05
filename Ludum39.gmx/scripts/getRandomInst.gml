// getRandomInst(object_index);     returns inst 

_obj = argument0; 

if (!instance_exists(_obj)) return -1;  

_r = irandom(instance_number(_obj) - 1);

_inst = instance_find(_obj,_r); 

return _inst;
