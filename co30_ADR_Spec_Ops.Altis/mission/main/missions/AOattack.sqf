/*
Author: ToxaBes (based on regions made by Quiksilver)
Description: All main AO's in one file
*/
#define OUR_SIDE WEST
#define ENEMY_SIDE EAST
#define ENEMY_SIDE_STR "EAST"
#define RADIO_TOWERS "Land_TTowerBig_1_F","Land_TTowerBig_2_F"
#define ALLOWED_EXPLOSIVES "IEDUrbanBig_Remote_Ammo","IEDUrbanBig_Remote_Ammo","IEDLandBig_Remote_Ammo","IEDUrbanSmall_Remote_Ammo","IEDLandSmall_Remote_Ammo","SatchelCharge_Remote_Ammo","DemoCharge_Remote_Ammo",""

private ["_target","_nameAO","_positionAO","_dt","_chance","_bunkerType","_bunkerPos","_bunkerObjects","_obj","_bunkerPositions ","_smallZ","_bigZ","_position","_flatPos","_res","_distance","_tower","_campPos","_hasMines","_groundPos","_hasMines","_minesArray","_newPos","_cargo","_nearestObject","_campObjects","_enemiesArray","_targetStartText","_showTowerMessage","_showBunkerMessage","_radioTowerDownText","_bunkerText","_null","_targetCompleteText","_tower","_tower_dmg","_units","_unitTypes","_vehicles","_isReward","_curVeh","_defend"];

eastSide = createCenter ENEMY_SIDE;
_target = [] call QS_fnc_getMainAO;
_nameAO = _target select 0;
_positionAO = _target select 1;

// Edit and place markers for new target
{_x setMarkerPos _positionAO;} forEach ["aoCircle", "aoMarker"];
"aoMarker" setMarkerText format["Захватить: %1", _nameAO];
sleep 1;

// Create AO detection trigger
_dt = createTrigger ["EmptyDetector", _positionAO];
_dt setTriggerArea [PARAMS_AOSize, PARAMS_AOSize, 0, false];
_dt setTriggerActivation [ENEMY_SIDE_STR, "PRESENT", false];
_dt setTriggerStatements ["this", "", ""];

// spawn bunker or tower outpost
_chance = random 10;
if (_chance > 5) then {
    _bunkerType = 1;
    _bunkerPos = [_positionAO, 1, (PARAMS_AOSize/2), 30, 0, 4, 0] call BIS_fnc_findSafePos;    
    _distance = _positionAO distance2D _bunkerPos;
    _flatPos = _bunkerPos isFlatEmpty [5, 1, 0.3, 30, 0, false];
    _res = count _flatPos;
    while {_distance > (PARAMS_AOSize/1.5) || _res == 0} do {
        _bunkerPos = [_positionAO, 1, (PARAMS_AOSize/2), 20, 0, 3, 0] call BIS_fnc_findSafePos;    
        _distance = _positionAO distance2D _bunkerPos;
        _flatPos = _bunkerPos isFlatEmpty [5, 1, 0.3, 15, 0, false];
        _res = count _flatPos;
    };
    _null = [_bunkerPos, ENEMY_SIDE, (configfile >> "CfgGroups" >> "Empty" >> "Military" >> "Outposts" >> "OutpostB")] call BIS_fnc_spawnGroup;
    _bunkerPos set [2, 0];    
    _obj = _bunkerPos nearestObject "Land_Cargo_Tower_V1_F";
    {
        _x addCuratorEditableObjects [[_obj], true];
    } forEach allCurators;
    _obj allowDamage false;       
    _bunkerObjects = [_obj] call QS_fnc_addFurniture;
} else {
    _bunkerType = 2;
    _bunkerPositions = _target select 2;
    _bunkerPosition = _bunkerPositions call BIS_fnc_selectRandom;
    _bunkerPos = [_bunkerPosition select 0, _bunkerPosition select 1, 0];        
    _smallZ = _bunkerPosition select 2;
    _bigZ = _bunkerPosition select 3;    
    _bunkerObjects = [_bunkerPos, _smallZ, _bigZ] call QS_fnc_createBunker;
};

// Spawn radiotower
_position = [[[_positionAO, (PARAMS_AOSize/3)], _dt], ["water", "out"]] call BIS_fnc_randomPos;
_flatPos = _position isFlatEmpty[3, 1, 0.3, 30, 0, false];
_res = count _flatPos;
while {_res < 1} do {
	_position = [[[_positionAO, (PARAMS_AOSize/3)], _dt], ["water", "out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty[3, 1, 0.3, 30, 0, false];
    _distance = _bunkerPos distance _position;
    _res = count _flatPos;
    if (_distance < 500) then {
        _res = 0;
    };
};
_tower = [RADIO_TOWERS] call BIS_fnc_selectRandom;
radioTower = _tower createVehicle _flatPos;
waitUntil { sleep 0.5; alive radioTower };
radioTower setVectorUp [0, 0, 1];
radioTowerAlive = true; publicVariable "radioTowerAlive";
radioTower addEventHandler
[
	"HandleDamage",
	{
	    _allowedExplosives = [ALLOWED_EXPLOSIVES];
		_tower_dmg = damage (_this select 0);
		if ((_this select 4) in _allowedExplosives) then {
			_tower_dmg = (_this select 2);
		};
		_tower_dmg;
	}
];
radioTower addEventHandler
[
	"Killed",
	{
	    _points = 10;
        _unit = _this select 1;
        _unit addScore _points;
		["ScoreBonus", ["Уничтожил Радиовышку!", _points]] remoteExec ["BIS_fnc_showNotification", _unit];
	}
];

// Spawn minefield
_campPos = _flatPos;
_hasMines = false;
_groundPos = [0,0,0];
if (_chance < PARAMS_RadioTowerMineFieldChance) then {
    _hasMines = true;
	_minesArray = [_flatPos] call QS_fnc_AOminefield;
	for "_i" from 1 to 3 do {
        _newPos = [_campPos, 35, 65, 3, 0, 15, 0] call BIS_fnc_findSafePos;
        while {_groundPos distance _newPos < 30} do {
            _newPos = [_campPos, 40, 60, 3, 0, 15, 0] call BIS_fnc_findSafePos;
        };
        _cargo = createVehicle ["Land_Cargo_Patrol_V3_F", [0,0,0], [], 0, "NONE"];
        _groundPos = _newPos;
        _cargo setPos _groundPos;
        _campObjects = ["Land_Cargo_Patrol_V3_F"];
	};
} else {
    _type = ["OutpostA", "OutpostE"] call BIS_fnc_selectRandom;
	if (_type == "OutpostE") then {
        _campPos = [(_flatPos select 0) - 2, (_flatPos select 1) + 10, _flatPos select 2];
        _campObjects = ["Land_HBarrier_5_F","Land_Cargo_House_V1_F","Land_Razorwire_F","Land_HBarrier_1_F","Land_HBarrier_3_F","Land_PortableLight_double_F","Land_PaperBox_closed_F","Land_WaterTank_F","Land_ToiletBox_F","Land_TTowerSmall_2_F","Land_GarbageBarrel_01_F","Land_Cargo_Patrol_V1_F"];
    };
    _null = [_campPos, ENEMY_SIDE, (configfile >> "CfgGroups" >> "Empty" >> "Military" >> "Outposts" >> _type)] call BIS_fnc_spawnGroup;
    if (_type == "OutpostA") then {
        _nearestObject = nearestObject [_campPos, "Land_BagBunker_Large_F"];
        deleteVehicle _nearestObject;
        _campObjects = ["Land_HBarrierBig_F","Land_BagBunker_Large_F","Land_HBarrier_5_F","Land_PortableLight_double_F","Land_ToiletBox_F","Land_Cargo20_military_green_F","Land_WaterTank_F","Land_WaterBarrel_F","Land_Cargo_Patrol_V1_F","Land_Pallets_F","Land_PaperBox_closed_F","Land_MetalBarrel_F","Land_BarrelEmpty_grey_F","Land_BarrelTrash_grey_F","Land_Pallets_stack_F"];
    };    
};
publicVariable "radioTower";
{
	_x addCuratorEditableObjects [[radioTower], false];
} foreach allCurators;

// Spawn enemies
sleep 1;
currentAO = "aoMarker";
_enemiesArray = [currentAO, _bunkerPos, _flatPos, _hasMines, _bunkerType] call QS_fnc_AOenemy;

// Set target start text
_targetStartText = format
[
	"<t align='center' size='2.2'>Захватить</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>Начинайте наступление.<br/><br/>Захватите командный пункт и уничтожьте радиовышку чтобы лишить противника авиаподдержки.",
	_nameAO
];

// Show global target start hint
GlobalHint = _targetStartText; publicVariable "GlobalHint"; hint parseText GlobalHint;
showNotification = ["NewMain", _nameAO]; publicVariable "showNotification";
showNotification = ["NewSub", "Уничтожить радиовышку противника"]; publicVariable "showNotification";
showNotification = ["NewSub", "Захватить командный пункт"]; publicVariable "showNotification";
sleep 2;
MAIN_AO_SUCCESS = false; publicVariable "MAIN_AO_SUCCESS";

// CORE LOOP
currentAOUp = true; publicVariable "currentAOUp";
if (PARAMS_AOReinforcementJet == 1) then {
	[] spawn {
		sleep (30 + (random 180));
		if (alive radioTower) then {
			while {(alive radioTower)} do {
				[] call QS_fnc_enemyCAS;
				sleep (480 + (random 480));
			};
		};
	};
};
_showTowerMessage = false;
_showBunkerMessage = false;
while {alive radioTower || !MAIN_AO_SUCCESS || !_showTowerMessage || !_showBunkerMessage} do {
    sleep 3;
    if (!alive radioTower && !_showTowerMessage) then {
        _showTowerMessage = true;

        // RADIO TOWER DESTROYED
        radioTowerAlive = false; publicVariable "radioTowerAlive";
        _radioTowerDownText = "<t align='center' size='2.2'>Радиовышка</t><br/><t size='1.5' color='#08b000' align='center'>Уничтожена</t><br/>____________________<br/><t size='1.2' color='#08b000' align='center'>Теперь противник не сможет вызвать авиаподдержку.</t><br/>";
        GlobalHint = _radioTowerDownText; hint parseText GlobalHint; publicVariable "GlobalHint";
        showNotification = ["CompletedSub", "Радиовышка уничтожена!"]; publicVariable "showNotification";
    };
    sleep 3;
    if (MAIN_AO_SUCCESS && !_showBunkerMessage) then {
        _showBunkerMessage = true;

        // BUNKER UNDER OUR CONTROL
        _bunkerText = "<t align='center' size='2.2'>Командный пункт</t><br/><t size='1.5' color='#08b000' align='center'>Захвачен</t><br/>____________________<br/><t size='1.2' color='#08b000' align='center'>Противник дезорганизован.</t><br/>";
        GlobalHint = _bunkerText; hint parseText GlobalHint; publicVariable "GlobalHint";
        showNotification = ["CompletedSub", "Командный пункт захвачен!"]; publicVariable "showNotification";
    };
};
currentAOUp = false; publicVariable "currentAOUp";

// DE-BRIEF 1
sleep 3;
_targetCompleteText = format ["<t align='center' size='2.2'>Захватили</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>", _nameAO];
{ _x setMarkerPos [-10000, -10000, -10000];} forEach ["aoCircle", "aoMarker"];
GlobalHint = _targetCompleteText; hint parseText GlobalHint; publicVariable "GlobalHint";
showNotification = ["CompletedMain", _nameAO]; publicVariable "showNotification";

// DEFEND AO
DEFEND_AO_VICTORY = true; publicVariable "DEFEND_AO_VICTORY";
if (PARAMS_DefendAO == 1) then {
    _chanceDefend = random 10;
    if (_chanceDefend > 5) then {
        sleep 3;    
	    _defend = [_target] spawn {_this call compile preProcessFileLineNumbers "mission\main\missions\AOdefend.sqf";};
        waitUntil {
            sleep 10;
            scriptDone _defend;
        };
    };
};

{ _x setMarkerPos [-10000, -10000, -10000]; } forEach ["aoCircle_2", "aoMarker_2"];

// DE-BRIEF
if (DEFEND_AO_VICTORY) then {
    _targetCompleteText = format ["<t align='center' size='2.2'>Удержали</t><br/><t size='1.5' align='center' color='#00FF80'>%1</t><br/>____________________<br/><t align='left'>Хорошая работа! Возвращайтесь на базу для перегруппировки на следующее задание.</t>", _nameAO];
} else {
    _targetCompleteText = format ["<t align='center' size='2.2'>Отступление</t><br/><t size='1.5' align='center' color='#DF013A'>%1</t><br/>____________________<br/><t align='left'>Мы отступаем! Возвращайтесь на базу для перегруппировки на следующее задание.</t>", _nameAO];

    // delete reward vehicles
    _vehicles = nearestObjects [[14714,16710], ["LandVehicle","Air","Ship"], 150];
    {
        _curVeh = _x;
        _isReward = _curVeh getVariable ["IS_REWARD", false];
        if (_isReward) then {
            if (count (crew _curVeh) > 0) then {
                {
                    _x action ["EJECT", _curVeh];
                } forEach (crew _curVeh);
            };
            deleteVehicle _curVeh;
        };
    } forEach _vehicles;    
};
GlobalHint = _targetCompleteText; publicVariable "GlobalHint"; hint parseText GlobalHint;
sleep 120;
deleteVehicle _dt;
deleteVehicle radioTower;
if (_chance < PARAMS_RadioTowerMineFieldChance) then {
    [_minesArray] spawn QS_fnc_AOdelete; 
};
_units = nearestObjects [_campPos, _campObjects, 50];
{
    deleteVehicle _x;
} foreach _units;
_units = nearestObjects [_bunkerPos, _bunkerObjects, 50];
{
    deleteVehicle _x;
} foreach _units;
[_enemiesArray] spawn QS_fnc_TBdeleteObjects;
sleep 10;
_unitTypes = ["O_Soldier_F","O_Soldier_GL_F","O_Soldier_AR_F","O_Soldier_SL_F","O_Soldier_TL_F","O_soldier_M_F","O_Soldier_LAT_F",
"O_medic_F","O_soldier_repair_F","O_soldier_exp_F","O_Soldier_AT_F","O_Soldier_AA_F","O_engineer_F","O_soldier_PG_F","O_recon_F",
"O_recon_M_F","O_recon_LAT_F","O_recon_medic_F","O_recon_TL_F","O_Soldier_AAT_F","O_soldierU_M_F","O_SoldierU_GL_F",
"O_HeavyGunner_F","O_Urban_HeavyGunner_F","O_support_MG_F","O_soldierU_F","O_soldierU_AR_F","O_soldierU_AAR_F","O_soldierU_LAT_F", 
"O_soldierU_AT_F","O_soldierU_AAT_F","O_soldierU_AA_F","O_soldierU_AAA_F","O_soldierU_TL_F","O_SoldierU_SL_F","O_soldierU_medic_F",
"O_soldierU_repair_F","O_soldierU_exp_F","O_engineer_U_F","O_soldierU_A_F","O_Sharpshooter_F","O_Urban_Sharpshooter_F","O_sniper_F"];
_units = nearestObjects [_positionAO, _unitTypes, PARAMS_AOSize];
{
    deleteVehicle _x;
} foreach _units;
true