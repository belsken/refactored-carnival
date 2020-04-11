if (keyboard_check_pressed(ord("I"))) showInventory = -showInventory;

if (!showInventory) exit;
#region Mouse Slot
mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);

var _cellXBuffer = (cellSize + xBuffer);
var _cellYBuffer = (cellSize + yBuffer);

var _iMouseX = mouseX - slotsX;
var _iMouseY = mouseY - slotsY;

var _nx = _iMouseX div _cellXBuffer;
var _ny = _iMouseY div _cellYBuffer;


if (_nx >= 0 and _nx < invSlotsWidth and _ny >= 0 and _ny < invSlotsHeight and _iMouseX > 0 and _iMouseY > 0)
{
	var _sx = _iMouseX - (_nx * _cellXBuffer);
	var _sy = _iMouseY - (_ny * _cellYBuffer);
	
	if (_sx < cellSize and _sy < cellSize)
	{
		mSlotX = _nx;
		mSlotY = _ny;
	}

}

selectedSlot = min(invSlots - 1, mSlotX + (mSlotY * invSlotsWidth));
#endregion

// Pickup Item

var _invGrid = dsInventory;
var _ssItem = _invGrid[# 0, selectedSlot];

if (pickupSlot != -1)
{
	if (mouse_check_button_pressed(mb_left))
	{
		if (_ssItem == item.none)
		{
			_invGrid[# 0, selectedSlot] = _invGrid[# 0, pickupSlot];
			_invGrid[# 1, selectedSlot] = _invGrid[# 1, pickupSlot];
			
			_invGrid[# 0, pickupSlot] = item.none;
			_invGrid[# 1, pickupSlot] = 0;
			
			pickupSlot = -1;
			
		}
		else if (_ssItem == _invGrid[# 0, pickupSlot])
		{
			if (selectedSlot != pickupSlot)
			{
				_invGrid[# 1, selectedSlot] += _invGrid[# 1, pickupSlot];
			
				_invGrid[# 0, pickupSlot] = item.none;
				_invGrid[# 1, pickupSlot] = 0;
				
			}
			
			pickupSlot = -1;
		}
		else
		{
			var _ssItemNum = _invGrid[# 1, selectedSlot]
			_invGrid[# 0, selectedSlot] = _invGrid[# 0, pickupSlot];
			_invGrid[# 1, selectedSlot] = _invGrid[# 1, pickupSlot];
			
			_invGrid[# 0, pickupSlot] = _ssItem;
			_invGrid[# 1, pickupSlot] = _ssItemNum;
			
		}
		
	}
	
}
else if (_ssItem != item.none)
{
	// drop item into game world
	if (mouse_check_button_pressed(mb_middle))
	{
		_invGrid[# 1, selectedSlot] -= 1;
		// destroy item in inventory if that was the last one
		if (_invGrid[# 1, selectedSlot] == 0)
		{
			_invGrid[# 0, selectedSlot] = item.none;
			
		}
		
		// create the item
		var _inst = instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oItem);
		with (_inst)
		{
			itemNum = _ssItem;
			xFrame = itemNum mod (sItemsWidth / cellSize);
			yFrame = itemNum div (sItemsWidth / cellSize);
			
		}
		
	}
	
	
	// drop pickup item into new slot
	if (mouse_check_button_pressed(mb_right))
	{
		pickupSlot = selectedSlot;
		
	}
	
}