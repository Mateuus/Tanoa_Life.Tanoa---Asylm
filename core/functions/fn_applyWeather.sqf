/*
	File: fn_applyWeather.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Receive set weather requests and... set weather.
*/

private["_overcast","_rain","_wind","_fog"];
_overcast = [_this,0,0,[0]] call BIS_fnc_param;
_rain = [_this,1,0,[0]] call BIS_fnc_param;
_wind = [_this,2,0,[0]] call BIS_fnc_param;
_fog = [_this,3,0,[0]] call BIS_fnc_param;

if (!isServer) then
{
	skipTime -24;
	86400 setOvercast _overcast;
	skipTime 24;
	0 = [] spawn {
		sleep 0.1;
		simulWeatherSync;
	};
}
else
{
	5 setOvercast _overcast;
	5 setFog 0; // Not using _fog
	setWind [_wind, _wind, true];
	5 setRain _rain;
	forceWeatherChange;
}; 