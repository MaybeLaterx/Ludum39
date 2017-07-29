// spread(x,y);         creates instance, returns nothing

_x = argument0; 
_y = argument1; 
_size = 32; 

_insts[0] = instance_position(x + _size,y,oFloor); 
_insts[1] = instance_position(x,y - _size,oFloor); 
_insts[2] = instance_position(x - _size,y,oFloor); 
_insts[3] = instance_position(x,y + _size,oFloor); 

_linsts = ds_list_create();

for (_k = 0; _k < 4; _k++) { 
    trace(_insts[_k])
    if (_insts[_k] != noone) ds_list_add(_linsts,_insts[_k]);
}

ds_list_shuffle(_linsts);

trace("SIZE" + string(ds_list_size(_linsts)));
for (_k = 0; _k < ds_list_size(_linsts) - 1; _k++) { 
    _inst = ds_list_find_value(_linsts,0);
    if (canGrow(_inst.x,_inst.y)) { 
        trace("Found corner, spreads to it");
        instance_create(_inst.x,_inst.y,oShadow0); 
        with (_inst) instance_destroy();
        ds_list_destroy(_linsts);
        return true;
    }
}

if (ds_list_size(_linsts) > 0) { 
    trace("No corner, spreading");
    _inst = ds_list_find_value(_linsts,0);
    instance_create(_inst.x,_inst.y,oShadow0); 
    with (_inst) instance_destroy();
    ds_list_destroy(_linsts);
    return true;
}

trace("Nowhere to spread");
ds_list_destroy(_linsts);
return false; 

