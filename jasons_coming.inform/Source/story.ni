"Jason's Coming" by Nichtschwert

Volume 1 - Config

Book 1 - Rules

Chapter 1 - Progress

Door damage is a number that varies. Door damage is 0.
Critical door damage is a number that varies. Critical door damage is 8.

Every turn:
	follow the progress rules.

The progress rules are a rulebook.

A progress rule (this is the Jason kills you rule):
	if the location of Jason is the location of the player and Jason is alive:
		if gravity is no and the broken bottle is in the gravity control room:
			say "Jason kicks off to float over and murder you. The glass shards in the air shred him to bits before he makes it to you.";
			end the story saying "Your irresponsible handling of hazardous materials paid off in the end.";
		otherwise:
			say "Jason [if gravity is no]floats[otherwise]walks[end if] over[if gravity is yes and the broken bottle is in the gravity control room], glass shards cracking under his boots,[end if] and he hits you with his machete and you die.";
			end the story.

A progress rule (this is the door breakage rule):
	if door damage is 0:
		say "Jason is beating down the door, but it holds yet.";
	else if door damage is 3:
		say "Jason continues to beat down the door. It's really starting to come apart.";
	else if door damage is critical door damage minus 2:
		say "Jason's still hammering away at the door. It's very nearly broken.";
	else if door damage is critical door damage minus 1:
		say "The door breaks down and is flung into the room. Jason is here!";
		if gravity is no:
			say "He looks a bit perplexed as he lifts off the ground entering the room. But he's been in space before. This will not stop him!";
		now Jason is in the gravity control room;
		now the wooden door is unlocked;
		now the wooden door is open;
	else if door damage is less than critical door damage:
		say "You can hear Jason beating down the door.";
	now door damage is door damage plus 1.

Chapter 2 - Time

Examining something is acting fast. Looking is acting fast. 

The take visual actions out of world rule is listed before the every turn stage rule in the turn sequence rules. 

This is the take visual actions out of world rule: if acting fast, rule succeeds. 

Chapter 3 - Jason Status

A person can be alive or dead. A person is usually alive.

Chapter 4 - Gravity

A boolean is a kind of value. The booleans are yes and no.

Gravity is a boolean that varies. Gravity is yes.

Gravity previously off is a boolean that varies. Gravity previously off is no.
Gravity previously on is a boolean that varies. Gravity previously on is no.

After switching off:
	if the noun is the gravity control lever:
		if Gravity previously off is no:
			say "You switch [the noun] off and suddenly feel very light. You accidentlaly kick yourself off the floor and bump into the ceiling.[if door damage is less than critical door damage] Jason continues banging on the door. Seems the gravity control only affects this room. very curious.[end if]";
			now gravity previously off is yes;
		otherwise:
			say "You turn gravity off again and start floating.";
		now gravity is no;
		if the glass bottle is not carried and glass bottle is not inside a container:
			say "The glass bottle starts floating about ominously. This is not safe.";
			now the glass bottle is in the gravity control room;
		if Jason is in the gravity control room:
			say "Jason starts floating off the floor as well, but he seems to quickly adapt. It's as if he's done this before!"

After switching on:
	if the noun is the gravity control lever:
		if Gravity previously on is no:
			say "You struggle to switch [the noun] on, but finally manage. Gravity returns much more suddenly than expected and you fall to the floor, landing painfully on your left shoulder.";
			now gravity previously on is yes;
		otherwise:
			say "You turn gravity on again and land deftly on your feet.";
		now gravity is yes;
		if the glass bottle is not carried and the glass bottle is not inside a container:
			say "The glass bottle falls to the floor and shatters into a thousand pieces. This is EXACTLY why we have that security case!";
			now the glass bottle is in the nowhere box;
			now the broken bottle is in the gravity control room;
		if Jason is in the gravity control room:
			say "Jason falls and hits his head on the desk, killing him instantly.";
			end the story saying "It was an accident!"

Chapter 5 - Violence

A firearm is a kind of thing.

Understand "shoot [something] with [something preferably held]" as shooting it with.
Understand "shoot [something preferably held] at [something]" as shooting it with (with nouns reversed).
Understand "fire [something preferably held] at [something]" as shooting it with (with nouns reversed).
Understand "shoot [something]" as shooting it.

Shooting it with is an action applying to one thing and one carried thing.
Shooting it is an action applying to one thing.

Check shooting it with:
	if the second noun is not a firearm:
		say "You make pew pew noises while waving [the second noun] around. This impresses nobody." instead;
	if the noun is the second noun:
		say "The logistics of this mystify me. Try something else!" instead.

Before shooting something (called the target) which is carried by the player with something:
	say "(first dropping [the target])";
	try silently dropping the target.

Carry out shooting:
	try shooting the noun with the gun.
	
Carry out shooting Jason with something:
	say "You shoot Jason and he falls over.";
	now Jason is dead;
	rule succeeds.

Carry out shooting the door with something:
	if door damage is less than Critical door damage:
		say "You fire at [the noun], punching big holes into it and showering the room with splinters. Was this a good idea?";
		now door damage is Critical door damage minus 1;
		rule succeeds;
	otherwise:
		say "You send a couple bullets down the hallway. I'm sure Frank in accounting appreciates it.";
		rule succeeds.

Carry out shooting the player with something:
	if Jason is in the gravity control room:
		say "With lightning speed Jason is on top of you, wrenching the gun from your hand. You burst into tears and Jason kneels down to embrace you. He tells you it's okay. It's okay to cry and you cry into his shoulder.";
		say "Jason listens to your problems for a full hour and gives you a handkerchief when you need one. Then he gives you the number of a therapist he trusts. He also gives you his own number and tells you to call him whenever you need some help.";
		end the story saying "Good End";
	otherwise:
		say "Sure.";
		end the story.

Carry out shooting the security case with something:
	say "You take a couple shots at the security case but find it frustratingly bulletproof.";
	rule succeeds.

Carry out shooting the glass bottle with something:
	say "The glass bottle shatters into a thousand pieces[if gravity is no] which start floating all over the place[end if]. This is EXACTLY why we have that security case!";
	now the glass bottle is in the nowhere box;
	now the broken bottle is in the gravity control room;
	rule succeeds.

Carry out shooting it with:
	say "You put a couple holes in [the noun] to little avail."

Chapter 6 - Movement

Instead of exiting, try going east.

Before going east:
	if the broken bottle is in the gravity control room and gravity is no:
		say "You try to float your way to the door, but all the glass shrapnel in the air proves to be your undoing.";
		end the story saying "Seriously. That's why we have the case."

Chapter 7 - Handling hazardous materials

After dropping the glass bottle:
	if gravity is no:
		say "The bottle starts floating ominously through the room. This is not safe.";
	otherwise:
		continue the action.

After taking the glass bottle:
	say "You take the hazardous glass bottle. Best hold on to it while operating the gravity controls."

Instead of taking the broken bottle, say "You cut your finger on the glass and think better of it."

Chapter 8 - Gifts

Instead of giving something to Jason:
	say "You offer [the noun] to Jason and he hesitates. He gingerly takes it out of your hand and then awkwardly hands you his machete. [If gravity is yes]It is very heavy and you almost drop it. [end if]Jason silently nods at you and turns to leave. Before [if gravity is yes]walking [otherwise]floating [end if]out the door he turns and flashes the peace sign. Then he is gone.";
	end the story saying "Nice knife you got there"


Chapter LAST - Victory

Every turn:
	follow the victory rules.

The victory rules are a rulebook.

A victory rule (this is the escape rule):
	if the player is not in the gravity control room:
		say "And you walk out. You just walk out.";
		end the story finally saying "You have escaped."

A victory rule (this is the murder rule):
	if Jason is dead:
		end the story finally saying "You killed him. Rude."



Volume 2 - Stuff

Book 1 - Nowhere

Jason is a man. "Jason is coming at you with a machete!"
Jason is wearing a mask and a flannel shirt. Jason is carrying a machete.
The description of Jason is "Oh god oh fuck it's Jason!"

The nowhere box is a container.

The broken bottle is a thing. "[if gravity is yes]The floor is littered with glass shards from the broken bottle.[otherwise]There are glass shards floating about everywhere! Best not move around too much!"
Understand "glass shards" as the broken bottle.

Book 2 - The World

Chapter 1 - Gravity Control

The gravity control room is a room. "You have locked yourself inside the gravity control room because Jason is coming to murder you. He's breaking down the door right now. Quick! Think of something!"

The player is in the gravity control room.

The wooden door is a door. "[if locked]The door to the east is locked. There's nothing but Jason through there.[otherwise]Little is left of the door. Could probably just walk on through."
The wooden door is east of the gravity control room and west of the hallway. It is lockable and locked.

The security case is a lockable, locked container in the gravity control room. "Affixed to the west wall is a sturdy security case with a lock on it."
The security case is fixed in place. The description of the security case is "A sturdy box held on the wall by strong screws. There's a small lock on it. A helpful label reads 'Hazardous materials case. Keep locked at all times. Do not operate gravity control unless hazardous materials have been locked away securely.'"

A glass bottle is in the security case. The description of the glass bottle is "A generic empty glass bottle. Handle with care. Hold tight or better yet, lock away while operating gravity controls."

The desk is in the gravity control room. "A plain-looking desk of dark wood stands in the northeastern corner. It has two drawers."
The upper drawer and the lower drawer are parts of the desk. The upper drawer and the lower drawer are openable closed containers.
In the lower drawer is a written note. The description of the note is "It simply reads 'Jason likes presents'."
In the upper drawer is the small key.  The small key unlocks the security case.
Understand "top drawer" as the upper drawer.
Understand "bottom drawer" as the lower drawer.

The loaded gun is a firearm on the desk. The description is "A fully loaded pistol. Perfectly normal thing to have lying around."
An apple is on the desk. The apple is edible.

The gravity control lever is a fixed in place device in the gravity control room. "A lever on the southern wall is labelled 'gravity control'."
It is switched on.


Volume 3 - Release

The story title is "Jason's Coming".
The story author is "Nichtschwert".
The story headline is "A very serious text adventure".
The story genre is "Comedy".
The release number is 0.
The story description is "Jason's coming to murder you. Will you survive?"
The story creation year is 2022.

Release along with cover art, the introductory booklet and an interpreter.