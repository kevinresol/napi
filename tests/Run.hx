package;

import Sys.*;

using sys.FileSystem;
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
					case Node | Cs:
						run(cast v);
					default:
						throw 'Cannot process $v';
				}
			case v: throw 'Cannot process $v';
		}
	}
	
	function run(target:Target) {
		compileHaxe(target);
		
		switch target {
			case Node: runNode();
			case Cs: runCs();
		}
	}
	
	/**
	 *  cd relative to root
	 *  @param path - 
	 */
	function cd(path:String) {
		setCwd(root + path);
	}
	function mkdir(path:String) {
		if(!path.exists()) path.createDirectory();
	}
	function cmd(v:String, args:Array<String>, ?pos:haxe.PosInfos) {
		switch command(v, args) {
			case 0: // ok;
			case code: trace('Exit code: $code', pos); exit(code);
		}
	}
	
	function compileHaxe(target:Target) {
		cd('tests/haxe');
		cmd('haxe', ['build_$target.hxml']);
	}
	
	function runNode() {
		cd('.');
		cmd('cp', ['tests/node/src/index.js', 'bin/node']);
		cd('bin/node');
		cmd('node', ['index.js']);
	}
	
	function runCs() {
		cd('tests/cs');
		cmd('mcs', ['-debug', '-out:../../bin/cs/bin/Test.exe', '-r:../../bin/cs/bin/cs.dll', 'src/*.cs']);
		cd('bin/cs/bin');
		cmd('mono', ['--debug', 'Test.exe']);
	}
	
	static function main() {
		new Run();
	}
}

@:enum
abstract Target(String) to String {
	var Node = 'node';
	var Cs = 'cs';
}