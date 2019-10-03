--[[-------------------------------------------------------------------------
Avoid notifications getting stuck on late load of HUD.
---------------------------------------------------------------------------]]

--This will be outside the edgeHUD table to avoid being overriden.
EdgeHUD_NotificationsQueue_Legacy = EdgeHUD_NotificationsQueue_Legacy or {}
EdgeHUD_NotificationsQueue_Progress = EdgeHUD_NotificationsQueue_Progress or {}

--Override the notification functions.
function notification.AddLegacy(text,type,length)
	table.insert(EdgeHUD_NotificationsQueue_Legacy,{text = text,type = type,length = length})
end

function notification.AddProgress(id,strText)
	EdgeHUD_NotificationsQueue_Progress[id] = strText
end

function notification.Kill(id)
	EdgeHUD_NotificationsQueue_Progress[id] = nil
end