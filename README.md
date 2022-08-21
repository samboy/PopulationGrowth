Since we are going over the story of Noah’s Flood in our Bible study,
I looked up how plausible this story is; it’s not, not without a large
number of miracles done by God in ancient times.

See this:

>http://talkorigins.org/faqs/faq-noahs-ark.html

# Repopulation

The next thing is to look at the repopulation after Noah’s flood.
Again, the repopulation models appear to not be viable based on historical
events:

>http://www.talkorigins.org/indexcc/CB/CB620.html

That article links to a now-dead link, which I will point to an
archived version of:

>https://archive.ph/d5qIU

Back in 2004, someone modelled this with a small Java program and
saw that the numbers are pretty silly:

>http://www.talkorigins.org/origins/postmonth/may04.html

Even more recently than that, the Creation Ministries International
made a model using C# and decided post-Ark repopulation was feasible.
They didn’t show us their homework, of course:

>https://creation.com/biblical-human-population-growth-model	

I will point out their model only considers the Ark population of
8 and the population reported at the time of the exodus from Egypt, and
completely ignores the Pyramid of Djoser, which is estimated to be
built in 2650 BCE or so.  I suppose one could argue the pyramids
were all built *before* the flood, but not only [doesn’t creation.com
make that argument](https://creation.com/adam-eve-noah-flood-ancient-egypt)
(they argue Egypt is 100% post-flood), there are a number of Pyramids
in Egypt which postdate the date of the flood, never mind the Israelites
were slaves in Egypt, and never mind there’s no evidence of a widespread
cataclysmic flood in recorded ancient Egypt history -- the mythological
Egyptian story of Re and Sekhmet is a flood of human blood, not water,
and, unlike the story of Gilgamesh and the flood, does not tell the
same essential flood story as Genesis does.

So, with that background in mind, can I update the May 2004 model here in
2022 to see how feasible populating the world is post-Ark.

There is also some low-quality discussion (namely, the discussion has
a large number of insults, and little information not covered elsewhere)
here:

>https://www.christianforums.com/threads/creationists-can-you-explain-post-flood-repopulation.1028182/

>https://www.christianforums.com/threads/creationists-can-you-explain-post-flood-repopulation-2.7879438/

# Model 1

I have written a Lua script which models population growth.  I assume
that God does a number of miracles after Noah and his family leave the
ark:

* Every wife, being born *before* Genesis 6:3 can have children when
  they are hundreds of years old
* Every person born before the flood lives to be 1,000 years old (this
  is older than the numbers given in the Bible, but this is a “back of 
  the envelope” calculation)
* Every person born after the flood lives to be 120 years old
* Every female, upon reaching 12 years of age (it was a long time ago)
  immediately becomes pregnant and gives birth to a child (5% of the time,
  twins) nine months later.  Upon giving birth, the female immediately
  becomes pregnant again.
* Every woman can become pregnant until they turn 50.  Indeed, every woman
  is constantly pregnant and gives birth every nine months from the ages of
  12 until they are 50.  In other words, every woman has 55, often times
  more (twins!), children.
* There are no stillbirths, every girl lives until they are child bearing
  age (indeed, until they are 120), and every girl becomes a baby making 
  machine.
* The model has an element for each and every member of the population;
  we do not approximate but create an entire simulated population.
* 52% of new births are women.  This is higher than real numbers, but God
  is performing a bunch of miracles with the ancient people.
* [Women do not ovulate when breast feeding](https://www.bbc.com/future/article/20151020-did-one-woman-really-give-birth-to-69-children), so it takes
  *another* miracle for a woman to immediately become pregnant after 
  birth.  Also, from that same article: It becomes a lot harder to
  become pregnant once a woman becomes 40 or so.
* There is no effort to address having enough food to feed this entire 
  population (in a world decimated by a global flood to boot).  Perhaps
  God dropped Manna from heaven.

Now, assuming all of that, we get something like this:

|      |      |
|------|------|
|Years after leaving ark|100|
|Year|-2270|
|Population|21507526|
|Living|21507526|
|Girls|11180800|
|Men|1885216|
|Women|2041023|
|Adults|3926239|
|Pregnant women|2031797|
|Avg. weeks pregnant|15.598720246166|
|Children|17581287|

Point being, we get 21,500,000 people within 100 years from a population
of eight under ideal circumstances for human birth.  So, if God did the
miracle of making people as fertile as possible, and if every girl starts
making babies at the age of 12 (yes, I know, but this was a *long time*
ago) until they are 50, then we can have, say, enough people in Egypt 
to start building the pyramids within 100 years of the flood ending 
and the Ark inhabitants repopulating the world. 

Mind you, either the flood happened sooner than we think or the 
Pyramid of Djoser (ca. 2650 BCE) was built later than we think, but we
can have 21,500,000 people in 100 years, then they can cool off
their birth rate and instead do things like build pyramids.

# The 1971 model

In 1971, the population increase rate was 2.1%, or 1.021.

That in mind, let’s run the 1971 population increase rate on the
population that leaves the ark.

A 2.1% population increase means we get an 8-fold population
increase every 100 years.  So, assuming Noah walked out of the
ark in 2350BCE, then we would have only 64 people in 2250BCE, and
we would have 5,444,517,870,735,015,415,413,993,718,908,291,383,296 
people in 2050CE, so the model does not in any way reflect reality.
There are both too few people to build the pyramids and too many people
compared to today’s actual population with a simple exponential
model.

# The not-quite-so-hyperfertile model

Let’s add death to the model (0.1% of anyone dying any given week),
let’s make it so a married woman (14 to 40) only has an 8% chance
of getting pregnant any given week, and a given pregnancy has a
0.2% chance of becoming a miscarriage any given week.

This is still a very hyperfertile model, but it’s one which doesn’t
need too many miracles from God after Noah gets off of the ark.

After 100 years, we get something like this:

|      |      |
|------|------|
|Years after leaving ark|100|
|Year|-2270|
|Population|6148|
|Living|3183|
|Girls|1649|
|Men|347|
|Women|362|
|Adults|709|
|Pregnant women|251|
|Avg. weeks pregnant|20.609561752988|
|Children|2474|

Now, after 200 years, it’s like this:

|      |      |
|------|------|
|Years after leaving ark|200|
|Year|-2170|
|Population|1497724|
|Living|770321|
|Girls|401016|
|Men|82588|
|Women|89616|
|Adults|172204|
|Pregnant women|62069|
|Avg. weeks pregnant|20.01662665743|
|Children|598117|

So, given *reasonable* birth and death rates, we need at least 200
years to have enough people in the world to make the pyramids of Egypt.
Even so, if we could build the Pyramid of Djoser with only 770,321 people
in the world, the dating for that pyramid has to be off by 500 years *or*
the dating we use for Noah’s ark has to be off by 500 years.
