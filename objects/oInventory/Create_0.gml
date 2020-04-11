/// @description 
depth = -1;
showInventory = true;

invSlots = 30;
invSlotsWidth = 5;
invSlotsHeight = 6;

selectedSlot = 0;
pickupSlot = -1;
mSlotX = 0;
mSlotY = 0;

xBuffer = 3;
yBuffer = 3;

inventoryXPositionBuffer = 4;
inventoryYPositionBuffer = 20;

inventoryWidth = sprite_get_width(sInventory);
inventoryHeight = sprite_get_height(sInventory);

cellSize = 13;

sInvItems = sItems;

sInvItemsCol = sprite_get_width(sInvItems) / cellSize;
sInvItemsRow = sprite_get_height(sInvItems) / cellSize;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

inventoryXPos = guiWidth - inventoryWidth - inventoryXPositionBuffer;
inventoryYPos = guiHeight - inventoryHeight - inventoryYPositionBuffer;

slotsX = inventoryXPos + 4;
slotsY = inventoryYPos + 4;


dsInventory = ds_grid_create(2, invSlots);

enum item 
{
	none			= 0,
	redpotion		= 1,
	greenpotion		= 2,
	redeye			= 3,
	blueeye			= 4,
	fang			= 5,
	wand			= 6,
	stone			= 7,	
	redflower		= 8,
	purpleflower	= 9,
	amethyst		= 10,
	height			= 11,
}

var _yy = 0; repeat(invSlots)
{
	dsInventory[# 0, _yy] = irandom_range(1, item.height - 1);
	dsInventory[# 1, _yy] = irandom_range(1, 10);
	
	_yy += 1;
	
}