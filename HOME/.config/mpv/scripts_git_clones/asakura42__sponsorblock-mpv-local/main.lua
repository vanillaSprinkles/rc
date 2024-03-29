-- sponsorblock_minimal.lua
-- based on https://codeberg.org/jouni/mpv_sponsorblock_minimal
-- This script skips sponsored segments of YouTube videos
-- using data from https://github.com/ajayyy/SponsorBlock

local utils = require('mp.utils')

function getranges()
    	local args = {
		"/bin/sh",
        	utils.join_path(mp.get_script_directory(), 'sponsorblock.sh'),
        	youtube_id
	}
    	local sponsors = mp.command_native({name = "subprocess", capture_stdout = true, playback_only = false, args = args})

    	if string.match(sponsors.stdout,"%[(.-)%]") then
		ranges = {}
		for i in string.gmatch(string.sub(sponsors.stdout,2,-2),"%[(.-)%]") do
			k,v = string.match(i,"(%d+.?%d*),(%d+.?%d*)")
			ranges[k] = v
		end
	end
	return
end

function skip_ads(name,pos)
	if pos ~= nil and ranges ~= nil then
		for k,v in pairs(ranges) do
			if tonumber(k) <= pos and tonumber(v) > pos then
				--this message may sometimes be wrong
				--it only seems to be a visual thing though
        			mp.osd_message("[sponsorblock] skipping forward "..math.floor(tonumber(v)-mp.get_property("time-pos")).."s")
				--need to do the +0.01 otherwise mpv will start spamming skip sometimes
				--example: https://www.youtube.com/watch?v=4ypMJzeNooo
				mp.set_property("time-pos",tonumber(v)+0.01)
            			return
    			end
		end
	end
	return
end

function file_loaded()
	local video_path = mp.get_property("path")
	local youtube_id1 = string.match(video_path, "https?://youtu%.be/([%w-_]+).*")
	local youtube_id2 = string.match(video_path, "https?://w?w?w?%.?youtube%.com/v/([%w-_]+).*")
	local youtube_id3 = string.match(video_path, "/watch.*[?&]v=([%w-_]+).*")
	local youtube_id4 = string.match(video_path, "/embed/([%w-_]+).*")
	local localyt_id1 = string.match(video_path, " [[]([%w-_]+)[]].*")
	local localyt_id2 = string.match(video_path, "-([%w-_]+).*")
	youtube_id = youtube_id1 or youtube_id2 or youtube_id3 or youtube_id4 or localyt_id1 or localyt_id2
	if not youtube_id or string.len(youtube_id) < 11 then return end
	youtube_id = string.sub(youtube_id, -11, -1)

	getranges()
	if ranges then
		ON = true
		mp.add_key_binding("b","sponsorblock",toggle)
		mp.observe_property("time-pos", "native", skip_ads)
	end
	return
end

function toggle()
	if ON then
		mp.unobserve_property(skip_ads)
		mp.osd_message("[sponsorblock] off")
		ON = false
		return
	end
	mp.observe_property("time-pos", "native", skip_ads)
	mp.osd_message("[sponsorblock] on")
	ON = true
	return
end

mp.register_event("file-loaded", file_loaded)
