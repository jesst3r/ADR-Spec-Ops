/*
Author: ToxaBes
Description: spawn darters with AP mines via player request
*/
_cnt = 0;
_limit = 2;
_type = "C_UAV_06_F";
_typeCheck = "GUER_UAV4";
_coords = getPosATL partizan_ammo;
_allUAVs = allMissionObjects _type;
{
    if (alive _x) then {
        _use = _x getVariable [_typeCheck, false];
        if (_use) then {
           _cnt = _cnt + 1;
        };        
    };
} forEach _allUAVs;
if (_cnt >= _limit) exitWith {
   [format ["<t color='#F44336' size = '.48'>Достигнут лимит в %1 дартеров!</t>", _limit], 0, 0.8, 3, 0.5, 0] spawn BIS_fnc_dynamicText;
};
_groundPos = [_coords, 0, 50, 1, 0, 0, 0] call QS_fnc_findSafePos;
_uav = createVehicle [_type, _groundPos, [], 0, "NONE"];
_uav setVariable [_typeCheck, true];
createVehicleCrew _uav;
_crewGroup = createGroup resistance;
_crewGroup deleteGroupWhenEmpty true;
(crew _uav) joinSilent _crewGroup;
_uav addAction ["<t color='#F44336'>Поставить мины</t>","scripts\setAPmines.sqf",[],-20,true,true,"",'true'];
_uav addEventHandler ['incomingMissile', {_this spawn QS_fnc_HandleIncomingMissile}];
[_uav] spawn {
    _uav = _this select 0;
    while {alive _uav} do {
        sleep 30;
        if (fuel _uav <= 0.1) exitWith {
            _uav setDamage 1;
            deleteVehicle _uav;
        }; 
    };          
};
["<t color='#7FDA0B' size = '.48'>Дартер вызван и ожидает на базе.</t>", 0, 0.8, 3, 0.5, 0] spawn BIS_fnc_dynamicText;