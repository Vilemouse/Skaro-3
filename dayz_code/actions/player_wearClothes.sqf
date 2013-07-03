/*
_item spawn player_wearClothes;
TODO: female
*/
private["_item","_onLadder","_hasclothesitem","_config","_text","_isFemale","_myModel","_humanity","_isBandit","_isHero","_itemNew","_model"];

_item = _this;
call gear_ui_init;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "str_player_21") , "PLAIN DOWN"]};

_hasclothesitem = _this in magazines player;
_config = configFile >> "CfgMagazines";
_text = getText (_config >> _item >> "displayName");

if (!_hasclothesitem) exitWith {cutText [format[(localize "str_player_31"),_text,(localize "str_player_31_wear")] , "PLAIN DOWN"]};

if (vehicle player != player) exitWith {cutText ["You may not change clothes while in a vehicle", "PLAIN DOWN"]};

_isFemale = ((typeOf player == "SurvivorW2_DZ")||(typeOf player == "BanditW1_DZ"));
if (_isFemale) exitWith {cutText ["Currently Female Characters cannot change to this skin. This will change in a future update.", "PLAIN DOWN"]};

_myModel = (typeOf player);
_humanity = player getVariable ["humanity",0];
_isBandit = _humanity < -2000;
_isHero = _humanity > 5000;
_itemNew = "Skin_" + _myModel;

if ( !(isClass(_config >> _itemNew)) ) then {
	_itemNew = if (!_isFemale) then {"Skin_Survivor2_DZ"} else {"Skin_SurvivorW2_DZ"};
};

switch (_item) do {
	case "Skin_Sniper1_DZ": {
		_model = "Sniper1_DZ";
	};
	case "Skin_Sniper2_DZ": {
		_model = "Sniper2_DZ";
	};
	case "Skin_Camo1_DZ": {
		_model = "Camo1_DZ";
	};
	case "Skin_Camo2_DZ": {
		_model = "Camo2_DZ";
	};
	case "Skin_Camo3_DZ": {
		_model = "Camo3_DZ";
	};
	case "Skin_Camo4_DZ": {
		_model = "Camo4_DZ";
	};
	case "Skin_Camo5_DZ": {
		_model = "Camo5_DZ";
	};
	case "Skin_Soldier1_DZ": {
		_model = "Soldier1_DZ";
	};
	case "Skin_Camo6_DZ": {
		_model = "Camo6_DZ"
	};	
	case "Skin_Camo7_DZ": {
		_model = "Camo7_DZ"
	};	
	case "Skin_Camo8_DZ": {
		_model = "Camo8_DZ"
	};	
	case "Skin_Camo9_DZ": {
		_model = "Camo9_DZ"
	};	
	case "Skin_Camo10_DZ": {
		_model = "Camo10_DZ"
	};	
	case "Skin_Camo11_DZ": {
		_model = "Camo11_DZ"
	};	
	case "Skin_Camo12_DZ": {
		_model = "Camo12_DZ"
	};	
	case "Skin_Camo13_DZ": {
		_model = "Camo13_DZ"
	};	
	case "Skin_Bandit1_DZ": {
		_model = "Bandit1_DZ"
	};	
	case "Skin_Survivor3_DZ": {
		_model = "Survivor3_DZ"
	};	
	case "Skin_Net_DZ": {
		_model = "Net_DZ";
	};	
	case "Skin_Survivor2_DZ": {
		_model = "Survivor2_DZ";
		if (_isBandit) then {
			_model = "Bandit1_DZ";
		};
		if (_isHero) then {
			_model = "Survivor3_DZ";
		};
	};
};

if (_model != _myModel) then {
	player removeMagazine _item;
	player addMagazine _itemNew;
	[dayz_playerUID, dayz_characterID, _model] spawn player_humanityMorph;
};