function defenseRating(req, isZerg, hasAir, isAllInGround)
	local rating = 0
	if Tracker:ProviderCountForCode("Advanced Tactics") > 0 then  -- All defense rating requirements decrease by 2 if Required Tactics is set to Advanced.
		rating = rating + 2
	end

	if Tracker:ProviderCountForCode("Siege Tank") > 0 then
		rating = rating + 5
		if Tracker:ProviderCountForCode("Graduating Range (Siege Tank)") > 0 then
			rating = rating + 1
		end
		if Tracker:ProviderCountForCode("Maelstrom Rounds (Siege Tank)") > 0 then
			rating = rating + 2
		end
	end

	if Tracker:ProviderCountForCode("Planetary Fortress") > 0 then
		rating = rating + 3
	end

	if Tracker:ProviderCountForCode("Bunker") > 0 then
		if Tracker:ProviderCountForCode("Marine") > 0 or Tracker:ProviderCountForCode("Marauder") > 0 then
			rating = rating + 3
		end
		if Tracker:ProviderCountForCode("Firebat") > 0 and isZerg then
			rating = rating + 2
		end
	end

	if Tracker:ProviderCountForCode("Perdition Turret") > 0 then
		rating = rating + 2
		if isZerg then
			rating = rating + 2
		end
	end

	if Tracker:ProviderCountForCode("Missile Turret") > 0 and hasAir then
		rating = rating + 2
	end

	if Tracker:ProviderCountForCode("Vulture") > 0 then
		rating = rating + 2
	end

	if Tracker:ProviderCountForCode("Liberator") > 0 then
		rating = rating + 2
	end

	if Tracker:ProviderCountForCode("Widow Mine") > 0 then
		rating = rating + 2
		if Tracker:ProviderCountForCode("Concealment (Widow Mine)") > 0 then
			rating = rating + 1
		end
	end

	if isZerg then
		if Tracker:ProviderCountForCode("Hive Mind Emulator") > 0 then
			rating = rating + 3
		end
		if Tracker:ProviderCountForCode("Psi Disrupter") > 0 then
			rating = rating + 3
		end
	end

	if isAllInGround then
		if Tracker:ProviderCountForCode("Banshee") > 0 or Tracker:ProviderCountForCode("Battlecruiser") > 0 then
			rating = rating + 3
		end
	end

	if rating >= req then
		return 1
	end
	else
		return 0
	end
end