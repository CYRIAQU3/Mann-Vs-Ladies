#pragma semicolon 1

#include <sourcemod>
#include <sdktools>
#define PLUGIN_VERSION "1.0.0"

public Plugin:myinfo =
{
    name = "Sound Replacer",
    author = "11530",
    description = "Changes sounds",
    version = PLUGIN_VERSION,
    url = "http://www.sourcemod.net"
}

public OnPluginStart()
{
	AddNormalSoundHook(MySoundHook);
}

public OnMapStart()
{
	/*char path[] = "sound/female/vo";
	new Handle:dir = OpenDirectory(path);
	if (dir == INVALID_HANDLE)
	{
		return false;
	}
 
	while (ReadDirEntry(dir, path, sizeof(path), type))
	{
		if (type == FileType_File && StrEqual(path, file))
		{
			PrintToServer("Precaching: %s", file);
			return true;
		}
	}
 
	CloseHandle(dir);

	PrecacheSound("female/vo/engineer_dominationengineer09.wav", true);*/
}

public Action:MySoundHook(clients[64], &numClients, String:sample[PLATFORM_MAX_PATH], &entity, &channel, &Float:volume, &level, &pitch, &flags)
{
	if (StrContains(sample, "vo/", false) != -1)
	{
		ReplaceString(sample, 255, "vo/", "female/");
		ReplaceString(sample, 255, ".mp3", ".wav");
		PrintToServer(sample);
		PrecacheSound(sample, true);
		return Plugin_Changed;
	}
	return Plugin_Continue;
}