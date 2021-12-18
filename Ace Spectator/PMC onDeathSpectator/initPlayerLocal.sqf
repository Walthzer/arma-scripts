/*
*	White Fox Assualt Regiment	
*	Author: D. Shark
*------------------------------------------------------------------
*	Adds Zeus ACE Interaction actions to pull players or Curators out of ACE Spectator mode.
*------------------------------------------------------------------
*/

["SpectatorRemoveZeus", {
	if (isNull (getAssignedCuratorLogic player)) exitWith {};
	[false, false, false] call ace_spectator_fnc_setSpectator;
}] call CBA_fnc_addEventHandler;

["SpectatorRemovePlayer", {
	if (player in _this) then {
		[false, false, false] call ace_spectator_fnc_setSpectator
	};
}] call CBA_fnc_addEventHandler;

private _fnc_handleRemovePlayers = {

	[
		"Free Players From Spectator",
		[	
			//OWNER Controls
			[
				"OWNERS:NOTITLE",
				"Players",
				[],
				true
			]
		],
		{
			((_this select 0) select 0) params ["_sides", "_groups", "_players", "_typeSelected"];

			private _selectedUnits = switch (_typeSelected) do {
				case 0: {flatten (_sides apply {units _x})};
				case 1: {flatten (_groups apply {units _x})};
				case 2: {_players};
				default {[]};
			};

			if (_selectedUnits isEqualTo []) exitWith {};
		
			["SpectatorRemovePlayer", _selectedUnits] call CBA_fnc_globalEvent;
		}

	] call zen_dialog_fnc_create;

};


private _actionSpectatorActions = ["SPECTATORACTIONS","Spectator","",{},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
private _actionSpectatorTogglePlayers = ["SPECTATORTOGGLEPLAYERS", "Remove Players", "",_fnc_handleRemovePlayers,{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
private _actionSpectatorToggleZeus = ["SPECTATOROFFZEUS", "Remove Zeus", "",{["SpectatorRemoveZeus"] call CBA_fnc_globalEvent;},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;

[["ACE_ZeusActions"], _actionSpectatorActions] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "SPECTATORACTIONS"], _actionSpectatorTogglePlayers] call ace_interact_menu_fnc_addActionToZeus;
[["ACE_ZeusActions", "SPECTATORACTIONS"], _actionSpectatorToggleZeus] call ace_interact_menu_fnc_addActionToZeus;