/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 091E838C
/// @DnDComment : This is a null$(13_10)check. It checks$(13_10)if there's no player$(13_10)objectbecause otherwise$(13_10)if the object wasn't created in runtime yet, we'd crash
/// @DnDArgument : "obj" "obj_player"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "obj_player"
var l091E838C_0 = false;l091E838C_0 = instance_exists(obj_player);if(!l091E838C_0){	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 2BDB07C9
	/// @DnDParent : 091E838C
	exit;

	/// @DnDAction : YoYo Games.Drawing.Draw_Self
	/// @DnDVersion : 1
	/// @DnDHash : 1D480826
	/// @DnDComment : draws this coin object itself$(13_10)to show the Coin image.
	/// @DnDParent : 091E838C
	draw_self();

	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 3E836001
	/// @DnDParent : 091E838C
	draw_set_font(noone);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 3892697C
	/// @DnDParent : 091E838C
	/// @DnDArgument : "x" "30"
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y" "-15"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "caption" ""Coins: ""
	/// @DnDArgument : "var" "obj_player.coins"
	draw_text(x + 30, y + -15, string("Coins: ") + string(obj_player.coins));}