/// addToArray(array,value);     returns success bool

_array = argument0; 
_value = argument1; 

if (is_array(_array)) { 
    _valPresent = false;
    for (_k = 0; _k < array_length_1d(_array); _k++) { 
        if (_array[_k] == _value) _valPresent = true;  
    }
    if (!_valPresent) _array[@ array_length_1d(_array)] = _value; 
    return true;
}
//else _array[@ 0] = _value; 
return false; 
