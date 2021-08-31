#include <dhooks>

public Plugin myinfo = {
	name        = "[NMRiH] Host_Say Crash Fix",
	author      = "Dysphie",
	description = "Fixes crash when host tries to use \"say\"",
	version     = "1.0.0",
	url         = ""
};

public void OnPluginStart()
{
	GameData gd = new GameData("saycrashfix.games");

	DynamicDetour hostSay = DynamicDetour.FromConf(gd, "Host_Say");
	if (!hostSay)
		SetFailState("Failed to detour Host_Say");
	hostSay.Enable(Hook_Pre, Host_Say);
	delete hostSay;
	delete gd;
}

public MRESReturn Host_Say()
{
	PrintToServer("[SayCrashFix] Cancelling \"say\" command to prevent a crash");
	return MRES_Supercede;
}

