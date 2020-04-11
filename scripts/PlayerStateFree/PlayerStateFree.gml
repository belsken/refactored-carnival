// Movement
hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

PlayerCollision();

// Update Sprite Index
var _oldSprite = sprite_index;
if (inputMagnitude != 0)
{
	direction = inputDirection;
	sprite_index = spriteRun;
	
} else sprite_index = spriteIdle;

if (_oldSprite != sprite_index) localFrame = 0;

// Update image index
PlayerAnimateSprite();







// Activate Key Logic
if (keyActivate)
{
	// 1. check for an entity to activate
	// 2. if there is nothing or if the thing there has no script - Roll
	// 3. Otherwise, there is something and it has a script - activate
	// 4. if the thing we activate is an NPC, make it face us
	
	var _activateX = lengthdir_x(10, direction);
	var _activateY = lengthdir_y(10, direction);
	activate = instance_position(x + _activateX, y + _activateY, pEntity);
	
	if (activate == noone || activate.entityActivateScript = -1)
	{
		state = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
		
	}
	else
	{
		// activate the entity
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		
		// make an npc face the player
		if (activate.entityNPC)
		{
			with (activate)
			{
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR;
				
			}
			
		}
		
	}
	
}