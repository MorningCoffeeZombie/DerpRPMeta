CATEGORY_NAME = "Links"
 
// Discord
function ulx.discord(ply)
        ply:SendLua([[gui.OpenURL("https://discord.gg/pyBcqgM")]])
end
local discord = ulx.command( CATEGORY_NAME, "ulx discord", ulx.discord, "!discord" )
discord:defaultAccess( ULib.ACCESS_ALL )
discord:help( "Invite to the Discord server!" )