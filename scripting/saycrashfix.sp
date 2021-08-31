public Plugin myinfo = {
	name        = "[NMRiH] Host_Say Crash Fix",
	author      = "Dysphie",
	description = "Fixes crash when host tries to use \"say\"",
	version     = "1.1.0",
	url         = ""
};


public Action OnClientSayCommand(int client, const char[] command, const char[] sArgs)
{
	return IsValidClient(client) ? Plugin_Continue : Plugin_Handled;
}

bool IsValidClient(int entity)
{
	return 0 < entity <= MaxClients && IsClientInGame(entity);
}

