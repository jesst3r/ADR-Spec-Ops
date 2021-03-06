/*
Author: ToxaBes
Description: create partizane base.
Format: [] call QS_fnc_createPartizanBase;
*/

private ["_basePositions", "_dist", "_position", "_accepted", "_curPos", "_respawnPos", "_sd", "_sp"];
_pos = param [0, [0,0,0]];
_basePositions = [
    [7465.5,8517.42,0.22], [6301.57,8845.25,0.2], [6031.8,9591,0.57], [8243.91,11103.7,0.38], [8274.81,11940,0.24], [7800.77,11301.6,0.21],
    [7938.99,12421,0.21], [6683.04,12347.7,0.34], [6119.49,12245.8,0.35], [8910.92,11895.4,0.2], [8638.76,9016.14,0.36], [8546.93,7652.44,0.2],
    [9430.14,7577.33,0.16], [9167.8,8704.07,0.2], [10028.4,9341.01,0.21], [10306.6,10561.7,0.15], [11410.8,12305.3,0.38], [11947,12739.2,0.28],
    [10998.5,13119.8,0.25], [10387.7,13254.5,0.13], [9488.06,13097.7,0.47], [12881.2,11618.5,0.28], [14116.8,10680,0.4], [13968.7,9992.71,0.013],
    [14670.6,9681.99,0.22], [14391.9,9585.78,0.39], [14124.5,8574.15,0.19], [13553.9,8391.28,0.11], [11724.1,6936.34,0.13], [10912,7849.35,0.13],
    [11061.6,9791.94,0], [11983.1,10600.6,0], [10066.1,11764.2,0], [10944.3,11488.6,0], [13907.2,12120.6,0], [13814.5,11897,0],
    [13247.3,12007.8,0], [11720.2,13081.9,0], [9276.36,13717.8,0], [9009.32,13801.7,0], [8712.27,13805.3,0], [9801.86,13587.6,0], [5494.93,11924.3,0],
    [5846.34,10363.1,0], [5791.21,10432.8,0], [5621.15,10209.7,0], [13304.7,13720.4,0], [12438.2,14215.7,0], [12400.9,3930.53,0], [3780.77,13997.7,0.79],
    [3066.95,11010.2,0.32], [857.311,7642.77,0.30], [2376.84,8159.35,0.16], [3372.81,3315.43,0.31], [5605.73,4006.93,0.2], [11249.4,5395.3,0.12],
    [11368,5367.45,0.18], [4608.72,5213.67,0.46], [9936.61,6715.63,0.5], [10654.1,8719.88,0], [6677.33,7852.77,0.24], [9273.59,9075.85,0],
    [7644.11,6811.17,0.12], [5760.19,8226.75,0], [2305.24,6333.6,0.4], [6727.31,9550.76,0.1], [7038.35,9724.04,0.4], [1842.61,11860.3,0.26],
    [2546.99,9053.61,0.6], [11336.5,7595.92,0.47], [11066,8481.09,0.65], [10979.9,8504.37,0], [4057.82,5680.18,0]
];
_dist = 1500;
_position = [0, 0, 0];
_accepted = false;
_curPos = getPos partizan_ammo;

if (format ["%1", _pos] == "[0,0,0]") then {
    while {!_accepted} do {
        _position = _basePositions call BIS_fnc_selectRandom;;
        if (_position distance2D (getMarkerPos "aoMarker") > _dist) then {
            if (_position distance2D (getMarkerPos "sideMarker") > _dist) then {
                if (_position distance2D (getMarkerPos "priorityMarker") > _dist) then {
                    if (_position distance2D (_curPos) > _dist) then {
                        _accepted = true;
                    };
                };
            };
        };
    };
} else {
    _position = _basePositions select 0;
    _delta = _position distance2D _pos;
    {
        if (_x distance2D _pos < _delta) then {
            _position = _x;
            _delta = _position distance2D _pos;
        };
    } forEach _basePositions;
};

_respawnPos = [((_position select 0) + random 3),((_position select 1) + random 3),_position select 2];
partizan_ammo setPos _position;
"respawn_guerrila" setMarkerPos _respawnPos;
"partizan_base" setMarkerPos _position;
["partizan_base", 0] remoteExec ["setMarkerAlphaLocal", west];
partizan_chemlight setPos _position;

if !(isNil "PARTIZAN_BASE_SCORE") then {
    if (PARTIZAN_BASE_SCORE > 18) then {
        _boxes = nearestObjects [_curPos, ["ReammoBox_F"], 50];
        {
            _newPos = [_respawnPos, 5, 50, 2, 0, 10, 0, [], []] call QS_fnc_findSafePos;
            _x setPos _newPos;
        } forEach _boxes;
    };
};