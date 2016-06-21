/*
	File: fn_revokeLicence.sqf
	
	Description:
	Handles the removal of any license
*/
[[_this select 3, player],"life_fnc_revokeLicenceAction",cursorTarget,false] spawn life_fnc_MP;
hint format["You have revoked %1's %2 license.",name cursorTarget, _this select 3];
systemChat format["You have revoked %1's %2 license.",name cursorTarget, _this select 3];