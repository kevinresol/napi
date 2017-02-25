package;

import Sys.*;

using tink.CoreApi;
using haxe.io.Path;

class Run {
	
	var root:String;
	
	function new() {
		root = programPath().directory().addTrailingSlash() + '..';
		root = root.normalize().addTrailingSlash();
		
		switch args() {
			case [v]:
				switch v {
					case Node:
						run(cast v);
					default:
						throw 'Cannot process $v';
				}
			case v: throw 'Cannot process $v';
		}
	}
	
	function run(target:Target) {
		compileHaxe(target);
	}
	
	/**
	 *  cd relative to root
	 *  @param path - 
	 */
	function cd(path:String) {
		setCwd(root + path);
	}
	
	function compileHaxe(target:Target) {
		var libs = [];
		
		var target = switch target {
			case Node:
				libs.push('hxnodejs');
				new Pair('js', 'bin/node/index.js');
			
		}
		
		var args = ['build.hxml', '-' + target.a, root + target.b];
		for(lib in libs) args = args.concat(['-lib', lib]);
		
		cd('tests/haxe');
		command('haxe', args);
	}
	
	static function main() {
		new Run();
	}
}

@:enum
abstract Target(String) {
	var Node = 'node';
}