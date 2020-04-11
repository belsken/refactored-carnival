/// @description
if (!showInventory) exit;


draw_sprite(sInventory, 0, inventoryXPos, inventoryYPos);


var _ii, _ix, _iy, _xx, _yy, _sx, _sy, _iitem, _invGrid;
_ii = 0; _ix = 0; _iy = 0; _invGrid = dsInventory;

repeat (invSlots)
{
	_xx = slotsX + ((cellSize + xBuffer) * _ix);
	_yy = slotsY + ((cellSize + yBuffer) * _iy);
	
	_iitem = _invGrid[# 0, _ii];
	_sx = (_iitem mod sInvItemsCol) * cellSize;
	_sy = (_iitem div sInvItemsCol) * cellSize;
	
	
	
	switch (_ii) 
	{
		case selectedSlot:
			if (_iitem > 0) draw_sprite_part_ext(sInvItems, 0, _sx, _sy, cellSize, cellSize, _xx, _yy, 1, 1, c_white, 1);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(sInvItems, 0, _sx, _sy, cellSize, cellSize, _xx, _yy, 1, 1, c_white, 0.3);
			gpu_set_blendmode(bm_normal);
		
		break;
		
		case pickupSlot:
			if (_iitem > 0) draw_sprite_part_ext(sInvItems, 0, _sx, _sy, cellSize, cellSize, _xx, _yy, 1, 1, c_white, 0.2);
		
		break;
		
		default: 
			if (_iitem > 0) draw_sprite_part_ext(sInvItems, 0, _sx, _sy, cellSize, cellSize, _xx, _yy, 1, 1, c_white, 1);
		break;
	}
	if (_iitem > 0) 
	{
		var _number = _invGrid[# 1, _ii];
		draw_text_color(_xx + (cellSize * 0.75), _yy, string(_number), c_black, c_black, c_black, c_black, 1);
		
	}
	
	
	_ii += 1;
	_ix = _ii mod invSlotsWidth;
	_iy = _ii div invSlotsWidth;
}

if (pickupSlot != -1)
{
	_iitem = _invGrid[# 0, pickupSlot];
	_sx = (_iitem mod sInvItemsCol) * cellSize;
	_sy = (_iitem div sInvItemsCol) * cellSize;
	
	draw_sprite_part_ext(sInvItems, 0, _sx, _sy, cellSize, cellSize, mouseX, mouseY, 1, 1, c_white, 1);
	
	var _inum = _invGrid[# 1, pickupSlot];
	draw_text_color(mouseX + (cellSize / 2), mouseY, string(_inum), c_black, c_black, c_black, c_black, 1);
}