//getLayoutWidth(layout);   returns int

_break1 = string_pos("
",argument0);
//trace("Break = " + string(break1));
_line1 = string_copy(argument0,1,_break1 - 1);
_width = string_length(_line1);
trace("Width = " + string(_width));

return _width;
