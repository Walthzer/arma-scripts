//Add to init box of everything that is a Supply truck or supply box -> Allows building in local area around it.
wfar_FortifySupplies = [];
if(isNil "wfar_FortifySupplies") then {
    wfar_FortifySupplies = [this];
} else {
    _null = wfar_FortifySupplies pushBack this;
};

//Respawn Add to the respawn module code field.
if(isNil "wfar_FortifySupplies") then {
    wfar_FortifySupplies = [_this#0];
} else {
    _null = wfar_FortifySupplies pushBack _this#0;
};
wfar_FortifySupplies = wfar_FortifySupplies - [objNull];

//Add to Init of mission.
[{
params ["_unit", "_object"];
if ([_unit] call ace_common_fnc_isEngineer) then {
    if ((wfar_FortifySupplies findIf {(_object distance _x) <= (_x getVariable["supplyRange", 10])}) > -1) then {
        true
    } else {
        _null = [] spawn {
            hint "Out of Supply!";
            sleep 5;
            hintSilent "";
        };
        false
    };
} else {
    _null = [] spawn {
    hint "Sneaky boi! You arn't an engineer";
    sleep 5;
    hintSilent "";
    };
    false
}
}] call acex_fortify_fnc_addDeployHandler;

_null = ["acex_fortify_objectPlaced", {
    params["_unit", "", "_object"];
    private _type = typeOf _object;
    private _timeNeeded = switch true do {
        case (_type in ["Land_BagFence_Short_F", "Land_BagFence_End_F", "Land_BagFence_Corner_F", "Land_BagFence_01_short_green_F", "Land_BagFence_01_end_green_F", "Land_BagFence_01_corner_green_F", "Land_Plank_01_4m_F"]): {10};
        case (_type in ["Land_BagFence_Long_F", "Land_BagFence_Round_F", "Land_BagFence_01_long_green_F", "Land_BagFence_01_round_green_F"]): {20};
        default {35};
    };
    systemChat str _timeNeeded;
    [_timeNeeded, [_unit, _object, (animationState _unit)], {[_this#0#0, _this#0#2, 1] call ace_common_fnc_doAnimation}, {deleteVehicle (_this#0#1); [_this#0#0, _this#0#2, 1] call ace_common_fnc_doAnimation}, "Hammer Time!"] call ace_common_fnc_progressBar;
    [_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;
}] call CBA_fnc_addEventHandler;