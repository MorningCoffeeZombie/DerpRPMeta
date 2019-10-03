--[[-------------------------------------------------------------------------
Setup
---------------------------------------------------------------------------]]

--Setup some basic language information.
local LANG = EdgeHUD.RegisterLanguage({
	Name = "German",
	Author = "Funny_TV", --https://www.gmodstore.com/users/Funny_TV
	CompatibleVersion = "1.7.3",
})

--[[-------------------------------------------------------------------------
Phrases - Lower Left
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"IDENTITY", "Identität")
EdgeHUD.AddPhrase(LANG,"JOB", "Job")

--[[-------------------------------------------------------------------------
Phrases - Lower Right
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"SPEEDOMETER_KPH","KPH")
EdgeHUD.AddPhrase(LANG,"SPEEDOMETER_MPH","MPH")

--TAGS: %P = Amount of props.
EdgeHUD.AddPhrase(LANG,"PROPLIMIT","%P Props")

EdgeHUD.AddPhrase(LANG,"GUNLICENSE","Waffenlizenz")

--[[-------------------------------------------------------------------------
Phrases - Top Left
---------------------------------------------------------------------------]]

--TAGS: %V = Number of votes
EdgeHUD.AddPhrase(LANG,"VOTE_QUEUE",nil) --ENGLISH: There are %V items in queue!

EdgeHUD.AddPhrase(LANG,"VOTE_TITLE_VOTE",nil) --ENGLISH: VOTING
EdgeHUD.AddPhrase(LANG,"VOTE_TITLE_QUESTION",nil) --ENGLISH: QUESTION

--TAGS: %T = Time until expiration.
EdgeHUD.AddPhrase(LANG,"VOTE_EXPIRE",nil) --ENGLISH: Expires in %T

EdgeHUD.AddPhrase(LANG,"VOTE_YES","Ja")
EdgeHUD.AddPhrase(LANG,"VOTE_NO","Nein")

EdgeHUD.AddPhrase(LANG,"VOTE_PENDING",nil) --ENGLISH: [EdgeHUD] You have a new vote/question pending. Take away your tool gun to vote.

--[[-------------------------------------------------------------------------
Phrases - Top right
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"TOPRIGHT_LOCKDOWN_TITLE","LOCKDOWN")
EdgeHUD.AddPhrase(LANG,"TOPRIGHT_LOCKDOWN","Der Bürgermeister hat einen Lockdown gestartet, begebt euch in euer Haus!")

EdgeHUD.AddPhrase(LANG,"TOPRIGHT_WANTED_TITLE","HAFTBEFEHL")
EdgeHUD.AddPhrase(LANG,"TOPRIGHT_WANTED","Nach dir wird gefahndet! Die Polizei sucht dich!")

EdgeHUD.AddPhrase(LANG,"TOPRIGHT_ARRESTED_TITLE","INHAFTIERT")

--TAGS: %T = Time until release.
EdgeHUD.AddPhrase(LANG,"TOPRIGHT_ARRESTED","Du wirst in %T freigelassen.")

EdgeHUD.AddPhrase(LANG,"TOPRIGHT_AGENDAHELP","Benutz /agenda <nachricht> um die Agenda zu bearbeiten.")

--[[-------------------------------------------------------------------------
Phrases - Time
---------------------------------------------------------------------------]]

--TAGS: %H = Hours, %M = Minutes
EdgeHUD.AddPhrase(LANG,"TIME_HOUR_MIN","%H Stunden und %M Minuten")

--TAGS: %M = Minutes, %S = Seconds
EdgeHUD.AddPhrase(LANG,"TIME_MIN_SEC","%M Minuten und %S Sekunden")

--TAGS: %S = Seconds
EdgeHUD.AddPhrase(LANG,"TIME_SEC","%S Sekunden")

--[[-------------------------------------------------------------------------
Phrases - Arrested
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"ARRESTED", "INHAFTIEREN")

--TAGS: %C = Criminal Name, %T = Time
EdgeHUD.AddPhrase(LANG,"ARRESTED_COP", "Du Inhaftierst %C für %T.")

--TAGS: %P = Officer Name, %T = Time
EdgeHUD.AddPhrase(LANG,"ARRESTED_SUSPECT", "Du wurdest von %P wegen %T Inhaftiert.")
EdgeHUD.AddPhrase(LANG,"ARRESTED_SUSPECT2", "Du wurdest für %T Inhaftiert.")

--[[-------------------------------------------------------------------------
Phrases - Released
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"RELEASED", "FREIGELASSEN")

--TAGS: %C = Criminal Name
EdgeHUD.AddPhrase(LANG,"RELEASED_COP", "Du hast %C aus dem Gefängnis freigelassen.")

EdgeHUD.AddPhrase(LANG,"RELEASED_SUSPECT", "Du wurdest aus dem Gefängnis entlassen.")

--[[-------------------------------------------------------------------------
Phrases - Wanted
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"WANTED", "HAFTBEFEHL")

--TAGS: %C = Criminal Name, %R = Reason
EdgeHUD.AddPhrase(LANG,"WANTED_COP", "Du ordnest einen Haftbefehl gegen %C wegen %R an.")

--TAGS: %P = Police Name, %R = Reason
EdgeHUD.AddPhrase(LANG,"WANTED_SUSPECT", "Ein Haftbefehl gegen dich wurde von %P wegen %R gestartet.")
EdgeHUD.AddPhrase(LANG,"WANTED_SUSPECT2", "Nach dir wird wegen %R gesucht.")

--[[-------------------------------------------------------------------------
Phrases - Unwanted
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"UNWANTED", "DURCHSUCHUNGSBEFEHL BEENDEN")

--TAGS: %S = Suspect Name
EdgeHUD.AddPhrase(LANG,"UNWANTED_COP", "Du entfernst %S's 'gesucht' Status.")

EdgeHUD.AddPhrase(LANG,"UNWANTED_SUSPECT", "Du bist nun nicht mehr von der Polizei gesucht.")

--[[-------------------------------------------------------------------------
Phrases - Warranted
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"WARRANTED", "DURCHSUCHUNGSBEFEHL")

--TAGS: %S = Suspect Name
EdgeHUD.AddPhrase(LANG,"WARRANTED_COP", "Du bist nicht befugt %S's Gebäude zu durchsuchen.")

--TAGS: %P = Police Name, %R = Reason
EdgeHUD.AddPhrase(LANG,"WARRANTED_SUSPECT", "Ein Durchsuchungsbefehl von %P wegen %R gegen dich wurde genehmigt.")
EdgeHUD.AddPhrase(LANG,"WARRANTED_SUSPECT2", "Du bekommst einen Durchsuchungsbefehl wegen %R.")

--[[-------------------------------------------------------------------------
Phrases - Unwarranted
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"UNWARRANTED", "DURCHSUCHUNGSBEFEHL ENTFERNEN")

--TAGS: %S = Suspect Name
EdgeHUD.AddPhrase(LANG,"UNWARRANTED_COP", "Du entfernst %S's Durchsuchungsbefehl.")

EdgeHUD.AddPhrase(LANG,"UNWARRANTED_SUSPECT", "Der Durchsuchungsbefehl ist nicht mehr aktiv.")

--[[-------------------------------------------------------------------------
Phrases - Vehicle Display
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"VEHICLE", "Fahrzeug")

--TAGS: %N = Name of owner
EdgeHUD.AddPhrase(LANG,"VEHICLE_OWNER", "Besitzer: %N")

--TAGS: %G = Groupname
EdgeHUD.AddPhrase(LANG,"VEHICLE_ACCESS_GROUP", "Zugang: %G")

--TAGS: %J = Number of jobs
EdgeHUD.AddPhrase(LANG,"VEHICLE_ACCESS_JOBS", "Zugang: %J job(s)")

EdgeHUD.AddPhrase(LANG,"VEHICLE_OWNER_UNKNOWN", "Besitzer: Unbekannt")

EdgeHUD.AddPhrase(LANG,"VEHICLE_NOTOWNABLE", "Nicht besitzbar")

EdgeHUD.AddPhrase(LANG,"VEHICLE_UNOWNED", "Kein Besitzer")

EdgeHUD.AddPhrase(LANG,"VEHICLE_COOWNERS", "Co-Besitzer:")

EdgeHUD.AddPhrase(LANG,"VEHICLE_ALLOWED_COOWNERS", "Erlaubte Co-Besitzer:")

--[[-------------------------------------------------------------------------
Phrases - Door Display
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"DOOR_SOLD", "Tür verkauft")
EdgeHUD.AddPhrase(LANG,"DOOR_FORSALE", "Zu verkaufen")
EdgeHUD.AddPhrase(LANG,"DOOR_F2PURCHASE", "'F2'um die Tür zu kaufen")

EdgeHUD.AddPhrase(LANG,"DOOR_COOWNERS", "Co-Besitzer:")
EdgeHUD.AddPhrase(LANG,"DOOR_ALLOWED_COOWNERS", "Erlaubte Co-Besitzer:")

--TAGS: %G = Name of group.
EdgeHUD.AddPhrase(LANG,"DOOR_GROUP_TITLE", "Gruppen Tür")
EdgeHUD.AddPhrase(LANG,"DOOR_ACCESS_GROUP", "Zugang: %G")

--TAGS: %J = Number of jobs.
EdgeHUD.AddPhrase(LANG,"DOOR_TEAM_TITLE", "Team Tür")
EdgeHUD.AddPhrase(LANG,"DOOR_ACCESS_TEAM", "Zugang: %J Job(s)")

--TAGS: %N = Name of owner.
EdgeHUD.AddPhrase(LANG,"DOOR_OWNER", "Besitzer: %N")

EdgeHUD.AddPhrase(LANG,"DOOR_OWNER_UNKNOWN", "Besitzer: Unbekannt")

--[[-------------------------------------------------------------------------
Phrases - Situations
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"LOCKDOWN", "LOCKDOWN")

EdgeHUD.AddPhrase(LANG,"LOCKDOWN_INITIATED", "Der Bürgermeister hat einen Lockdown gestartet, begebt euch in euer Haus!")

--[[-------------------------------------------------------------------------
Phrases - Door Menu
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"DOORMENU_BUY_DOOR", "Tür kaufen")
EdgeHUD.AddPhrase(LANG,"DOORMENU_BUY_VEHICLE", "Auto kaufen")

EdgeHUD.AddPhrase(LANG,"DOORMENU_SELL_DOOR", "Tür verkaufen")
EdgeHUD.AddPhrase(LANG,"DOORMENU_SELL_VEHICLE", "Auto verkaufen")

EdgeHUD.AddPhrase(LANG,"DOORMENU_ADDOWNER", "Besitzer hinzufügen")
EdgeHUD.AddPhrase(LANG,"DOORMENU_REMOVEOWNER", "Besitzer entfernen")

EdgeHUD.AddPhrase(LANG,"DOORMENU_ALLOWOWNERSHIP", "Kaufen erlauben")
EdgeHUD.AddPhrase(LANG,"DOORMENU_DISALLOWOWNERSHIP", "Kaufen nicht erlauben")

EdgeHUD.AddPhrase(LANG,"DOORMENU_SETTITLE_DOOR", "Tür Titel setzen")
EdgeHUD.AddPhrase(LANG,"DOORMENU_SETTITLE_VEHICLE", "Auto Titel setzen")

EdgeHUD.AddPhrase(LANG,"DOORMENU_EDITGROUPS", "Gruppen zugang editieren")

--[[-------------------------------------------------------------------------
Phrases - Crash Screen
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"CRASHSCREEN_TITLE", "Verbindung verloren")
EdgeHUD.AddPhrase(LANG,"CRASHSCREEN_TEXT1", "Es sieht so aus als wenn du die verbindung zu Server verloren hast.")
EdgeHUD.AddPhrase(LANG,"CRASHSCREEN_TEXT2", "Bitte hab etwas Gedult, wir versuchen dich wieder mit dem Server zu verbinden.")

EdgeHUD.AddPhrase(LANG,"CRASHSCREEN_RECONNECT", "Reconnect")
EdgeHUD.AddPhrase(LANG,"CRASHSCREEN_LEAVE", "Verlassen")

--[[-------------------------------------------------------------------------
Phrases - Gesture Menu
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"GESTURE_BOW", "Verbeugen")
EdgeHUD.AddPhrase(LANG,"GESTURE_SEXYDANCE", "Sexy Tanz")
EdgeHUD.AddPhrase(LANG,"GESTURE_FOLLOWME", "Folge mir")
EdgeHUD.AddPhrase(LANG,"GESTURE_LAUGH", "Lachen")
EdgeHUD.AddPhrase(LANG,"GESTURE_LIONPOSE", "Löwen Pose")
EdgeHUD.AddPhrase(LANG,"GESTURE_NONVERBALNO", "Nein")
EdgeHUD.AddPhrase(LANG,"GESTURE_THUMBSUP", "Daumen hoch")
EdgeHUD.AddPhrase(LANG,"GESTURE_WAVE", "Welle")
EdgeHUD.AddPhrase(LANG,"GESTURE_DANCE", "Tanzen")

--[[-------------------------------------------------------------------------
Phrases - Vehicle warnings HUD.
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_EXTERIORLIGHT", "[Vehicle] : Licht Defekt erkannt. Überprüfen Sie das Licht bevor Sie weiterfahren.")
EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_EXHAUST", "[Vehicle] : Abgasschaden erkannt. Bitte suchen Sie dringend einen Mechaniker auf.")
EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_ENGINE", "[Vehicle] : Motorschaden erkannt. Bitte suchen Sie dringend einen Mechaniker auf.")

EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_TIRE_FRONTLEFT", "Vorne-Links")
EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_TIRE_FRONTRIGHT", "Voren-Rechts")
EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_TIRE_BACKLEFT", "Hinten-Links")
EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_TIRE_BACKRIGHT", "Hinten-Rechts")

--TAGS: %T = Damaged tires.
EdgeHUD.AddPhrase(LANG,"VEHICLE_DMG_TIRES", "[Fahrzeug] : Reifen Luftdruck nicht mehr vorhanden: (%T).")

--[[-------------------------------------------------------------------------
Phrases - Battery Notifications.
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"CHARGER_CONNECTED", "Ladegerät verbunden")
EdgeHUD.AddPhrase(LANG,"CHARGER_DISCONNECTED", "Ladegerät entfernt")
EdgeHUD.AddPhrase(LANG,"BATTERY_STATUS", "Batterie Status")

EdgeHUD.AddPhrase(LANG,"CHARGING_STARTED", "Dein Computer lädt nun.")
EdgeHUD.AddPhrase(LANG,"CHARGING_ABORTED", "Dein Computer lädt nun nicht mehr.")

--TAGS: %B = Battery precentage left.
EdgeHUD.AddPhrase(LANG,"BATTERY_NOTICE", "Du hast nur noch %B% Akkukapazität übrig. Verbinde ein Ladegerät.")

--[[-------------------------------------------------------------------------
Phrases - Level bar
---------------------------------------------------------------------------]]

--TAGS: %L = Current Level, %P = Percentage to next level
EdgeHUD.AddPhrase(LANG,"LEVELBAR", "Level %L - %P%")

--[[-------------------------------------------------------------------------
Phrases - AdminTell
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"ADMINTELL_TITLE", "ADMIN NACHRICHTEN")
EdgeHUD.AddPhrase(LANG,"ADMINTELL_NOMSG", "Keine Nachricht vorhanden")


--[[-------------------------------------------------------------------------
Phrases - General
---------------------------------------------------------------------------]]

EdgeHUD.AddPhrase(LANG,"CLOSE","Schließen")