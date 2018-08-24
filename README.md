# Native-friendly API for Haxe targets

Write code in Haxe, distribute in native-friendly form.

## Initiative

Haxe is great, one can write once and run the code in many targets.
But it isn't very great as it is almost all-or-nothing.
One either write the whole solution in Haxe or not use Haxe at all.
Because it isn't really easy (but definitely not impossible) to mix
Haxe with the native language in the same project.

There are a few reasons for that. One of the major reasons is that
in order to standardize across targets, Haxe has created it own set of
data types, some of which has quite different interfaces than the
equivalent types on the native side. And this make it not so easy to
communicate between Haxe and the native targets.

Also, Haxe is a garbage-collected language, which is another major obstacle
for smoothly integrate Haxe into non-GCed targets like c++. Extra care
is required in passing data across the bridge.

This project serves as an intiative trying to close the gap between
Haxe and its native targets.

## Goals 

#### Data Type

The primary goal of this initiative is to provide common data types that
are useful to both Haxe and Native developers.

For example, in Haxe/JS a Map is implemented as an object with a `h` key holding
the key/value pairs, while on Haxe/Java & Haxe/C# it is a double array. Both of them 
are not very useful to a native developer.

For this particular problem, one of the possible solution is to use `Proxy` in
JS to forward field access into the underlying `h` object. Or implement a wrapper
over the Map (Java), IDictionary(C#) interfaces.

Function type and Enum are some another topics we defintely want to discuss.

#### Others

Here lists some of the extended goals that may worth discussion:

- Making private functions private
- Genenate native-friendly class from an ordinary Haxe class
- Macro that generates the required header/wrapper/whatnot for c++
- Documentations, tutorials, starter kits, etc
- Toolkit for building, testing, packing binaries, submiting to central repositories, etc

## Collaborations Welcome

This initiative requires experitize from each targets and couldn't possibly be done
by a single person. So, any kind of collaborations will be more than welcomed, may it
be a comment, idea, discussion, code example, test case, reference. Anything.

## Experimental

For now, all codes inside this repo (if there are any) are deemed as experimental.
Use at your own risk.
