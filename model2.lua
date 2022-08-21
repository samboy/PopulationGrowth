#!/usr/bin/env lua

-- Public domain (or BSD0 if you must have a formal copyright and license)
-- By Sam Trenholme 2022

local people = {} -- Population
local thisWeek = 0 -- Weeks after -2370 (2370 BCE)
boyChance = 48 -- Chance out of 100 of giving birth to a boy
-- These ages are in *weeks* not years
preFloodDeathAge = 52000 -- People born before the flood live 1,000 years
postFloodDeathAge = 6240 -- As per Genesis 6:3 after the flood live 120 years
-- Keep in mind that as per https://www.jewfaq.org/marriage.htm a 12-year-old
-- girl getting married is allowed in traditional Jewish culture.  I will
-- assume that, on average, in ancient times women were 14 when they got
-- married.
minBirthAge = 728 -- They got married at 14 years (it was a long time ago)
maxBirthAge = 2080 -- Sarah (Genesis 17:17) aside, no pregnanacy once 40
gestationWeeks = 40 -- 38-42 weeks, we’ll make it 40
pregnancyChance = 8 -- 8% chance of getting pregnant every week
stillbirthChance = 2 -- This is per mil (not percent) chance of a pregnancy
                     -- becoming a stillbirth every week; it’s 0.2% here
deathChance = 1 -- Every week, everyone alive has a 0.1% of dying

--math.randomseed(os.time())
math.randomseed(222) -- Make this constant so others can reproduce results
rand = math.random

local function percent(p)
  if rand(0,99) < p then return true end
  return false
end
local function permil(p)
  if rand(0,999) < p then return true end
  return false
end

local function birth()
  local baby = {}
  if percent(boyChance) then baby.sex = "boy" else baby.sex = "girl" end
  baby.age = 0 -- Age is in weeks
  baby.weeksPregnant = 0 -- 0 means not pregnant
  baby.preFlood = false -- Person born after the flood, as per Gen 6:3
  baby.name = "You are number " .. tostring(#people + 1)
  baby.alive = true
  people[#people + 1] = baby
end

-- Show demographics
local function report()
  print("")
  print("Weekly demographic report")
  print("")
  print("Years after leaving ark: " .. tostring(thisWeek/52))
  print("Year: " .. tostring(-2370 + (thisWeek / 52)))
  print("Population: " .. tostring(#people))
  local girls = 0
  local children = 0
  local men = 0
  local women = 0
  local living = 0
  local adults = 0
  local isPregnant = 0
  local totalWeeks = 0
  for a = 1,#people do
    if people[a].alive then
      if people[a].sex == "girl" then girls = girls + 1 end
      if people[a].age < minBirthAge then children = children + 1 end
      if people[a].weeksPregnant and people[a].weeksPregnant > 0 then
        isPregnant = isPregnant + 1
	totalWeeks = totalWeeks + people[a].weeksPregnant
      end
      if people[a].age >= minBirthAge then
        if people[a].sex == "girl" then 
          women = women + 1 
        end
        if people[a].sex == "boy" then 
          men = men + 1 
        end
	adults = adults + 1
      end
      living = living + 1
    end
  end
  print("Living: " .. tostring(living))
  print("Girls: " .. tostring(girls))
  print("Men: " .. tostring(men))
  print("Women: " .. tostring(women))
  print("Adults: " .. tostring(adults))
  print("Pregnant women: " .. tostring(isPregnant))
  print("Avg. weeks pregnant: " .. tostring(totalWeeks / isPregnant))
  print("Children: " .. tostring(children))
end

-- Weekly tick: Every week, update age, etc
local function tick()
  thisWeek = thisWeek + 1
  for a = 1,#people do
    h = people[a]
    if h.sex == "girl" and h.alive and h.age >= minBirthAge and 
       h.weeksPregnant == 0 and (h.preFlood or h.age <= maxBirthAge) and
       percent(pregnancyChance) then 
      h.weeksPregnant = 1 
    end
    if h.sex == "girl" and h.weeksPregnant >= 1 and h.alive then
      h.weeksPregnant = h.weeksPregnant + 1
      if permil(stillbirthChance) then h.weeksPregnant = 0 -- Miscarriage
      elseif h.weeksPregnant >= gestationWeeks then 
        birth()
	if percent(5) then -- Twins are 2%, but 5% because of miracles
	  birth()
	  if percent(1) then -- Triplets!
	    birth()
	  end
	end
	h.weeksPregnant = 0
      end
    end
    -- People die of old age.  
    if h.preFlood and h.age > preFloodDeathAge then
      h.alive = false
    end
    if h.preFlood == false and h.age > postFloodDeathAge then
      h.alive = false
    end
    -- Small chance of dying otherwise each month
    if permil(deathChance) then h.alive = false end
    -- One week older
    h.age = h.age + 1
  end
end
    
-- A handful of people leave the Ark
local function leaveArk()
  people[1] = {}
  people[1].name = "Noah"
  people[1].age = 21736 -- 418 years
  people[1].sex = "boy"
  people[1].alive = true
  people[1].preFlood = true

  people[2] = {}
  people[2].name = "noahsWife"
  people[2].age = 5200 -- 100 years
  people[2].sex = "girl"
  people[2].alive = true
  people[2].weeksPregnant = 0
  people[2].preFlood = true

  people[3] = {}
  people[3].name = "shem"
  people[3].age = 5096 -- 98 years
  people[3].sex = "boy"
  people[3].alive = true
  people[3].preFlood = true

  people[4] = {}
  people[4].name = "shemsWife"
  people[4].age = 1560 -- 30 years
  people[4].sex = "girl"
  people[4].alive = true
  people[4].weeksPregnant = 0
  people[4].preFlood = true

  people[5] = {}
  people[5].name = "ham"
  people[5].age = 4576 -- 88 years
  people[5].sex = "boy"
  people[5].alive = true
  people[5].preFlood = true

  people[6] = {}
  people[6].name = "hamsWife"
  people[6].age = 1560 -- 30 years
  people[6].sex = "girl"
  people[6].alive = true
  people[6].weeksPregnant = 0
  people[6].preFlood = true

  people[7] = {}
  people[7].name = "japeth"
  people[7].age = 5616
  people[7].sex = "boy"
  people[7].alive = true
  people[7].preFlood = true

  people[8] = {}
  people[8].name = "japethsWife"
  people[8].age = 1560 -- 30 years
  people[8].sex = "girl"
  people[8].alive = true
  people[8].weeksPregnant = 0
  people[8].preFlood = "true"

end

-- OK, let’s run the simulation
leaveArk()
for z=1,10400 do
  tick()
  if z % 52 == 0 then
    report()
    io.flush()
  end
end
