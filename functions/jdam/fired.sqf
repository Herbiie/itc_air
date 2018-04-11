params ["", "", "", "", "_ammo", "", "_projectile", "_gunner"];
if (!local _gunner) exitWith {};
_this call itc_air_jdam_fnc_guidance;
_this call itc_air_jdam_fnc_fuzing;

(vehicle player) setVariable ["bomb_flying", _projectile];

/*
params ["", "", "", "", "_ammo", "", "_projectile", "_gunner"];

_targetIndex = ITC_AIR_CURRENTWP;
_fuze = ITC_AIR_PROGFUZE;

if (!local _gunner) exitWith {};

//FUZES
[{
    (_this select 0) params ["_gunner", "_projectile", "_distance", "_ammo", "_position", "_targetIndex", "_fuze","_velocity", "_dir", "_prevPosition"];
    _type = getText (configFile >> "CfgAmmo" >> _ammo >> "ITC_subMunition");
    if (alive _projectile) then {
        if(_position select 0 != _prevPosition select 0 && _position select 1 != _prevPosition select 1 && _position select 2 != _prevPosition select 2) then {
            (_this select 0) set [9, _position];
        };
        _position = getPosATL _projectile;
        (_this select 0) set [4, _position];

        _velocity = velocity _projectile;
        (_this select 0) set [7, _velocity];
        _dir = direction _projectile;
        (_this select 0) set [8, _dir];
    };

    _alt = (getPosATL _projectile) select 2;

    if(_fuze == "prox" &&(_alt < 9 || !alive _projectile )) exitWith {
        createVehicle [_type, _position, [], 0, "FLY"];
        deleteVehicle _projectile;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (!alive _projectile) then {
        //player sideChat format ["POS %1", _position vectorDiff _prevPosition];
        //drop ["\a3\data_f\Cl_basic","","Billboard",1,20,_position,[0,0,0],1,1.275,1.0,0.0,[1],[[0,0,1,1]],[0],0.0,2.0,"","",""];
        _posCorrection = _position vectorDiff _prevPosition;
        _position = _position vectorAdd _posCorrection;
        if(_fuze == "dly") then {
            _movement = _velocity vectorMultiply 0.025;
            _newPos = _position vectorAdd _movement;
            if(_newPos select 2 < 0) then {
                _newPos = [_newPos select 0, _newPos select 1, 0.1];
            };
            createVehicle [_type, _newPos, [], 0, "FLY"];
            //drop ["\a3\data_f\Cl_basic","","Billboard",1,20,_position,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];
            //drop ["\a3\data_f\Cl_basic","","Billboard",1,20,_newPos,[0,0,0],1,1.275,1.0,0.0,[1],[[0,1,0,1]],[0],0.0,2.0,"","",""];
        };
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_gunner, _projectile, _distance, _ammo, getPosATL _projectile, _targetIndex, _fuze, [0,0,0], 0, getPosATL _projectile]] call CBA_fnc_addPerFrameHandler;

if(count ([] call ace_microdagr_fnc_deviceGetWaypoints) == 0) exitWith{};
_angle = ITC_AIR_IMPANGLE;
_targetCoordinates = ((([] call ace_microdagr_fnc_deviceGetWaypoints) select _targetIndex) select 1) vectorAdd [0,0,1];
_dropTime = time;
//GUIDANCE
[{
    (_this select 0) params ["_projectile", "_ammo", "_position", "_targetCoordinates", "_stage", "_time", "_angle"];
    if (!alive _projectile) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
    _position = getPosASL _projectile;
    (_this select 0) set [2, _position];
    (_projectile call BIS_fnc_getPitchBank) params ["_pitch", "_bank"];
    _speed = vectorMagnitude (velocity _projectile);

    _dElev = (_position select 2) - (_targetCoordinates select 2);
    _distHorizontal = [_position select 0, _position select 1, 0] distance [_targetCoordinates select 0, _targetCoordinates select 1, 0];
    _angleTo = atan(_dElev / _distHorizontal);
    _angleToHoriz = _projectile getRelDir _targetCoordinates;
    _angleToHoriz = if(_angleToHoriz > 180) then [{_angleToHoriz - 360},{_angleToHoriz}];

    //KILL THE GUIDANCE IF TARGET IS BEHIND PROJECTILE
    if(abs _angleToHoriz > 90) exitWith{[_this select 1] call CBA_fnc_removePerFrameHandler;};

    //player sideChat format ["HeightDiff %1 Dist %2 Pitch %3",round  _dElev, round _distHorizontal, round _angleTo];

    _dist = _position distance _targetCoordinates;
    _tof = _dist / _speed;
    //SEPARATION STAGE
    if(_stage == "SEP") then {
        //player sideChat "SEPARATION";
        if(time > _time + 1) then {
            (_this select 0) set [4, "GLIDE"];
            //player sideChat "GLIDING";
        };
    };

    //player sideChat format ["ANGLE %1 %2", _projectile getDir _targetCoordinates, getDir _projectile];
    if((_projectile getDir _targetCoordinates) > getDir _projectile) then {
        _projectile setDir (getDir _projectile + 0.5);
    } else {
        _projectile setDir (getDir _projectile - 0.5);
    };

    _angleDiff = abs(_pitch - _angle);
    _turnRate = 5;
    _turnDistRequired = (0.7 * (_angleDiff / _turnRate)) * (_speed / 10);

    if(_stage == "GLIDE") then {
        //player sideChat format ["%1 %2", _angleDiff, _turnDistRequired];
        if(_pitch < 0) then {
            [_projectile, _pitch + 0.1, 0] call BIS_fnc_setPitchBank;
        };
        if(_angleTo > _angle || _distHorizontal < _turnDistRequired) then {
            (_this select 0) set [4, "DIVE"];
        };
    };



    if(_stage == "DIVE") then {
        _diff = abs(_pitch - (_angleTo * -1));
        if(_pitch > (_angleTo * -1)) then {
            [_projectile, _pitch - (_diff / _turnRate), 0] call BIS_fnc_setPitchBank;
        } else {
            [_projectile, _pitch + (_diff / _turnRate), 0] call BIS_fnc_setPitchBank;
        };
    };
}, 0.1, [_projectile, _ammo, getPosATL _projectile, _targetCoordinates, "SEP", _dropTime, _angle]] call CBA_fnc_addPerFrameHandler;
*/
