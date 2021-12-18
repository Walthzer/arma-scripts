/*
*	White Fox Assualt Regiment	
*	Author: D. Shark
*------------------------------------------------------------------
*	Force player into ACE spectator mode. Only if a corpse exists.
*   This Emulates RespawnOnStart = -1 behaviour.
*------------------------------------------------------------------
*/

if (isnull (_this#1)) exitWith {};
[true, false] call ace_spectator_fnc_setSpectator;