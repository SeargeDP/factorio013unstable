#Hacked Splitters

*Hacked Splitters* mods [Factorio](https://www.factorio.com), adding a
 new class of splitters—the "hacked splitter". These splitters
 perfectly balance transport belt inputs, but can no longer
 effectively manage multi-item belts (though you are willing to try).

Hacked splitters are not special entities; they are true
splitters. They can be placed over vanilla splitters and vice
versa. You can see them in action
[here](https://gfycat.com/ImperfectHiddenGrayfox) and
[here](https://gfycat.com/GrizzledQuarrelsomeHoverfly).

*Hacked Splitters* is released under this
 [`LICENSE`](https://bitbucket.org/doktorstick/hacked-splitters/src/tip/LICENSE?fileviewer=file-view-default).

#Releases / Roadmap

##1.0.0 `PWNED`

**Released:** 2016-08-13

This release marks the debut of *Hacked Splitters*. It includes a
small but functional set of features:

* Three new entities—hacked splitter, hacked fast splitter, and hacked
  express splitter, which build upon the splitter, fast splitter, and
  express splitter, respectively;

* Extremely minor graphics tweaks for the splitter icons and
  entities. They are denoted by three white hatch marks on the
  splitter bezels; and

* English localization.

##1.0.x `0xCC`

These `0xCC` release series consists of maintenance patches for the
`PWNED` release within the limited scope of bug fixes, localization
additions, and performance optimizations, if needed.

###1.0.1 `0xCC01` (under development)

* Removed `session_tick` as it was not really needed and there was
  a suggestion that it might cause a multiplayer desync.
* Fixed express belt compression in main processing loop (reported by
  [goofy183](https://www.reddit.com/user/goofy183).

##1.1 `FPLv2`

The Factorio Public License v2.0 (FPLv2) release brings hacked
hardware to the masses via the
[`LuaRemote`](http://lua-api.factorio.com/latest/LuaRemote.html) API.
This will allow other modders to register their versions of hacked
splitter entities and associated belt speeds.

This release was planned to be much larger (see `Hackathon` below for
more info). I'm investigating the feasibility of creating a splitter
circuit base-station by tinkering with combinators to see if they can
read state from entities not directly attached, or by having entities
broadcast to them.

##2.0 `Hackathon`

**Status:** Indefinitely postponed

The original goal of this release is to add circuit logic to the
splitter. The plan was that this would be done as part of `FPLv2`.
Oh, how ignorant was I.

I had thought that by adding circuit connection attributes to the
entities paired with a little Lua code, an item would inherit circuit
properties. Seemed reasonable. Sufficed to say that as of 0.13, this
did not work. Below is a small catalog of things I wanted to do.

* Backpressure signal (output). Output green when all output lines are
  available, yellow for some pressure, and red when all lines have
  backpressure;

* Throughput signal (output);

* Item mask for split control (input). A constant combinator
  outputting an item-type and masked value would control the lines
  items were split to. For example, copper plate with a value of 3
  would balance to the same output belt (lines 5 and 6);

* Update graphics to include circuit leads; and

* Recipe adjustment for +1 iron plate (circuit connections).
