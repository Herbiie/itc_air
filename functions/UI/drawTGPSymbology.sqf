params ["_plane"];

_pitchBank = _plane call BIS_fnc_getPitchBank;
_pitchBank params ["_pitch", "_bank"];

_targ = [_plane] call itc_air_common_fnc_get_turret_target;

_waypoints = [] call ace_microdagr_fnc_deviceGetWaypoints;
_hasWP = (count _waypoints > 0);

_curWP = ["NO WP", [0,0,0]];
if(_hasWP) then {
    _curWP = _waypoints select ITC_AIR_CURRENTWP;
};
_curWP params ["_wpName", "_wpPos"];
_distToWP = _plane distance _wpPos;

[_pitch, _bank] call itc_air_ui_fnc_pitch_bank_indicators;
[_plane] call itc_air_ui_fnc_sa_cue;
[_plane] call itc_air_ui_fnc_laser_status;
[(_targ select 1) distance (_targ select 2)] call itc_air_ui_fnc_yardstick;
[_targ select 1] call itc_air_ui_fnc_grid;

[_plane, _curWP] call itc_air_ui_fnc_tof_bomb;