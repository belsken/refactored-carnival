cellSize = 13;

sInvItems = sItems;

sItemsWidth = sprite_get_width(sInvItems);
sItemsHeight = sprite_get_height(sInvItems);

itemNum = -1;
xFrame = 0;
yFrame = 0;

xOffset = cellSize / 2;
yOffset = cellSize * (2/3);

dropMove = true;
var _itemDir = irandom_range(0, 359);
var _len = 16;
goalX = x + lengthdir_x(_len, _itemDir);
goalY = y + lengthdir_y(_len, _itemDir);