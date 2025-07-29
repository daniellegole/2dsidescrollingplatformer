/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 0AAF353F
/// @DnDComment : Original (no gamepad) method$(13_10)I would be pressing right$(13_10)-1 would be pressing left$(13_10)0 would be no input
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "keyboard_check(vk_right) - keyboard_check(vk_left)"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 462B5BA5
/// @DnDDisabled : 1
/// @DnDArgument : "expr" "move_x*walk_speed"
/// @DnDArgument : "var" "move_x"


/// @DnDAction : YoYo Games.Miscellaneous.Debug_Show_Message
/// @DnDVersion : 1
/// @DnDHash : 11E1BC43
/// @DnDArgument : "msg" "move_x"
show_debug_message(string(move_x));

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 36E5D897
/// @DnDComment : is on ground
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap"
var l36E5D897_0 = instance_place(x + 0, y + 2, [collision_tilemap]);if ((l36E5D897_0 > 0)){	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5B060E1A
	/// @DnDComment : Reset y movement
	/// @DnDParent : 36E5D897
	/// @DnDArgument : "var" "move_y"
	move_y = 0;

	/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Pressed
	/// @DnDVersion : 1
	/// @DnDHash : 3E63BBF3
	/// @DnDDisabled : 1
	/// @DnDParent : 36E5D897
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 61D8FB99
	/// @DnDDisabled : 1
	/// @DnDParent : 3E63BBF3
	/// @DnDArgument : "expr" "-jump_speed"
	/// @DnDArgument : "var" "move_y"

	/// @DnDAction : YoYo Games.Collisions.If_Object_At
	/// @DnDVersion : 1.1
	/// @DnDHash : 2E42E222
	/// @DnDComment : is there a wall
	/// @DnDParent : 36E5D897
	/// @DnDArgument : "x" "x + (25 * sign(move_x))"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "object" "collision_tilemap"
	var l2E42E222_0 = instance_place(x + (25 * sign(move_x)), y + 0, [collision_tilemap]);if ((l2E42E222_0 > 0)){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 651E46DA
		/// @DnDComment : jump over it!
		/// @DnDParent : 2E42E222
		/// @DnDArgument : "expr" "-jump_speed"
		/// @DnDArgument : "var" "move_y"
		move_y = -jump_speed;
	
		/// @DnDAction : YoYo Games.Collisions.If_Object_At
		/// @DnDVersion : 1.1
		/// @DnDHash : 205FA110
		/// @DnDComment : is there a gap in the floor?
		/// @DnDParent : 2E42E222
		/// @DnDArgument : "x" "x + (30 * sign(move_x))"
		/// @DnDArgument : "y" "y + 50"
		/// @DnDArgument : "object" "collision_tilemap"
		/// @DnDArgument : "not" "1"
		var l205FA110_0 = instance_place(x + (30 * sign(move_x)), y + 50, [collision_tilemap]);if (!(l205FA110_0 > 0)){	/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 45CBA9DD
			/// @DnDComment : turn around for movement on X
			/// @DnDParent : 205FA110
			/// @DnDArgument : "expr" "move_x* -1"
			/// @DnDArgument : "var" "move_x"
			move_x = move_x* -1;
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 00CF7AD4
			/// @DnDComment : jump
			/// @DnDParent : 205FA110
			/// @DnDArgument : "expr" "-jump_speed"
			/// @DnDArgument : "var" "move_y"
			move_y = -jump_speed;}}}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 02167A4A
/// @DnDComment : If we are NOT on the ground
else{	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 1E25E0F4
	/// @DnDComment : If we are falling after a jump
	/// @DnDParent : 02167A4A
	/// @DnDArgument : "var" "move_y"
	/// @DnDArgument : "op" "1"
	/// @DnDArgument : "value" "10"
	if(move_y < 10){	/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2BF55E6D
		/// @DnDComment : add gravity
		/// @DnDParent : 1E25E0F4
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "move_y"
		move_y += 1;}}

/// @DnDAction : YoYo Games.Collisions.If_Object_At
/// @DnDVersion : 1.1
/// @DnDHash : 51EA7331
/// @DnDArgument : "x_relative" "1"
/// @DnDArgument : "y" "2"
/// @DnDArgument : "y_relative" "1"
/// @DnDArgument : "object" "collision_tilemap_death_zone"
var l51EA7331_0 = instance_place(x + 0, y + 2, [collision_tilemap_death_zone]);if ((l51EA7331_0 > 0)){	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 2CC95359
	/// @DnDApplyTo : other
	/// @DnDParent : 51EA7331
	with(other) instance_destroy();}

/// @DnDAction : YoYo Games.Movement.move_and_collide
/// @DnDVersion : 1
/// @DnDHash : 23DFFFA1
/// @DnDArgument : "xvel" "move_x"
/// @DnDArgument : "yvel" "move_y"
/// @DnDArgument : "maxxmove" "walk_speed"
/// @DnDArgument : "maxymove" "jump_speed"
/// @DnDArgument : "object" "collision_tilemap"
move_and_collide(move_x, move_y, collision_tilemap,4,0,0,walk_speed,jump_speed);