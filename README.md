raylib API for Vala
===================

**UPDATE 19/07/22** 

Since this repo is now linked from the official [RayLib Bindings](https://github.com/raysan5/raylib/blob/master/BINDINGS.md) 
page it makes sense for me to think about relocating it to GitHub in case my home server is down for any 
extended period. No promises but I might also have a look at what has changed between RayLib v3.0 and RayLib 
v4.0. I haven't used Vala for a while for more of a "life just got in the way" thing than anything so I will 
have to get my head back into it. I also don't think I ever produced a library for the binding which I probably should.

**Original README**

TL;DR: This is a WIP Vala binding for raylib. As of the time of writing this README the version I am writing
against is 3.0.0 release 4. Right now, I've not worked out how to incorporate that version info into
the bindings.

The story so far (I didn't intend to write this much!)...

Vala is a great language. For a long time now I've lamented the days where I could just pick up an IDE
and within a few hours start to have a full GUI based application that actually served a purpose and
solved a problem. I'm referring to Visual Studio which I was familiar with from probably the late '90s
to 4 or 5 years ago. I've tried with Apple but the tooling is just crazy. All those outlets and, well,
I actually can't remember what all the bits are called but frankly, unless you live and breath that stuff
on a day to day basis, good luck remembering it and getting it embedded in your brain. And the way their
Swift language works honestly to me just feels like a bunch of hipsters needed to justify their existence
(yep, sorry, but I'm old enough to remember only having 1KB to play with on the ZX81!).

I do Java EE for a living, have done for many years now but have also earned my way with C and have been 
known to dabble with embedded and assembly and stuff too. So just recently i have been involved in game 
development on the Switch (checkout, and buy if you feel the itch [Fuze4](https://www.nintendo.co.uk/Games/Nintendo-Switch-download-software/FUZE4-Nintendo-Switch-1626336.html])
I didn't write it, but like I say, I'm involved and you won't regret it). It got me thinking that I wanted
to be able to apply some of the things I'd learnt and take them further. Turns out raylib is just the
ticket for that but I didn't want to get bogged down with going back to C.

And then I discovered Vala...

Initially I thought it was not going to be much use because I don't use Gnome as such. But it turns out
i3 on Solus is just fine, and what do you know, so is MacOS with the help of a sprinkling of 'Brew' packages.

raylib, as i've discovered, is pretty big so it's going to take a while. This is therefore to be considered
incomplete until this README says otherwise. Also my Vala knowledge is pretty thin right now. Therefore
the order in which the binding will be implemented will be a mix of 1) low hanging fruit and 2) things I
actually want to use myself. A word of warning - audio is always without fail the last thing I ever get
round to in games, closely followed by fancy inputs. It's just too much fun getting stuff on screen.

Also, be aware that right now, little attention has been paid to memory management. As a first pass the
rule is if it compiles, ship it. I'm well aware that's not really the right attitude but like I say,
raylib is big and I have to start somewhere.

Another thing that I'm all too aware of is the concept of mapping C types and structs into Vala Classes.
It would appear that raylib has been written in such a way that doesn't really lend itself too much by
way of encapsulating functionality in instantiable objects. Take the Window class that I have created
for example. I've gone over it a few times and I can't really see a way to have a true Vala class and
yet there is a bunch of functionality there that just begs to belong together. So I've taken the initial 
stab of creating a class with a bunch of static methods.

Part way through it dawned on me that the C header file (which I copied as a starting point) is organised
such that all of the structs are first, then the enums, then the methods. That means that when working
through the VAPI implementation I could be missing relations between structs and methods that could end
up lending themselves to the implementation of a class.

I'll revist it at some point. For now you can at least use the methods I've got to from Vala the same
way as you would use them from C. That's better than not using them at all if you don't like C.