/// placeHuman();           void

humanPlaced = false;
while (!humanPlaced) { 
    rTile = instance_find(oFloor,irandom(instance_number(oFloor) - 1));
    
    _x = rTile.x; 
    _y = rTile.y; 
    _size = 32; 
    
    _insts[0] = instance_position(_x + _size,_y,all); 
    _insts[1] = instance_position(_x,_y - _size,all); 
    _insts[2] = instance_position(_x - _size,_y,all); 
    _insts[3] = instance_position(_x,_y + _size,all); 
    
    for (_i = 0; _i < 4; _i++) if (_insts[_i].object_index == oBattery) {
        instance_create(rTile.x,rTile.y,oHuman);  
        with (rTile) instance_destroy();  
        if (!global.mutedSfx) audio_play_sound(sndMove,0,false);
        oController.powersLeft--;   
        exit;
    }
}
