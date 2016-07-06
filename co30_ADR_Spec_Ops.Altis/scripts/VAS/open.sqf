_uavs = ["B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UGV_01_F","B_UGV_01_rcws_F","I_UAV_01_F","I_UAV_02_F","I_UAV_02_CAS_F","I_UGV_01_F","I_UGV_01_rcws_F",
"O_UAV_01_F","O_UAV_02_F","O_UAV_02_CAS_F","O_UGV_01_F","O_UGV_01_rcws_F","B_T_UAV_03_F","O_T_UAV_04_CAS_F"];
if ((typeOf cameraOn) in _uavs) exitWith {hint "Снаряжение недоступно пока вы подключены к БПЛА/БПА.";};
if(isNil "VAS_init_complete") exitWith {hint "VAS never initialized.\n\nThis means CfgFunctions.hpp was never called via Description.ext";};
if(!VAS_init_complete && !vas_disableSafetyCheck) exitWith {if((time - VAS_init_timeOnStart) > 25) then {[] call VAS_fnc_mainInit;}; hint "VAS hasn't finished loading yet."};

//Set up some variables incase a 'limited' weapons/mags/items field is meant for that container (Mainly support for an upcoming feature).
VAS_box_weapons = (_this select 0) getVariable "bis_weapons";
VAS_box_magazines = (_this select 0) getVariable "bis_magazines";
VAS_box_items = (_this select 0) getVariable "bis_items";
VAS_box_backpacks = (_this select 0) getVariable "bis_backpacks";
VAS_box_goggles = (_this select 0) getVariable "bis_goggles";

createDialog "VAS_Diag";
["guns",false] spawn VAS_fnc_mainDisplay;
ctrlShow [2507,false];
ctrlShow [2508,false];
ctrlShow [2509,false];
ctrlShow [2850,false];
ctrlShow [2851,false];
disableSerialization;

VAS_blur = ppEffectCreate ["DynamicBlur", 401];
VAS_blur ppEffectEnable true;
VAS_blur ppEffectAdjust [1.5];
VAS_blur ppEffectCommit 0;
