[{
params ["_unit", "_object"];
if ([_unit] call ace_common_fnc_isEngineer) then {
    if ((wfar_FortifySupplies findIf {(_object distance _x) <= (_x getVariable["supplyRange", 50])}) > -1) then {
        true
    } else {
        hint "Too Far From Supplies!";
        [{hintSilent ""}, [], 5] call CBA_fnc_waitAndExecute;
        false
    };
} else {
    hint "You are not worthy to wield the power of Thor!";
    [{hintSilent ""}, [], 5] call CBA_fnc_waitAndExecute;
    false
}
}] call ace_fortify_fnc_addDeployHandler;