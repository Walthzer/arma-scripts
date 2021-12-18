//Add to init box of everything that is a Supply truck or supply box -> Allows building in local area around it.
if(isNil "wfar_FortifySupplies") then {
    wfar_FortifySupplies = [this];
} else {
    _null = wfar_FortifySupplies pushBack this;
};
//

//Respawn Add to the respawn module code field.
if(isNil "wfar_FortifySupplies") then {
    wfar_FortifySupplies = [_this#0];
} else {
    _null = wfar_FortifySupplies pushBack _this#0;
};
wfar_FortifySupplies = wfar_FortifySupplies - [objNull];
//