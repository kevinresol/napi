package napi;

import sys.io.Process;

class Run {
	static function main() {
		var args = Sys.args();
		#if interp args.pop(); #end
		
		switch new Process('haxelib', ['path', 'napi-tools']).exitCode() {
			case 0: // ok
			default: 
				// Sys.command('haxelib', ['git', 'napi-tools', '<the url>']);
		}
		
		Sys.command('haxelib', ['run', 'napi-tools'].concat(args));
	}
}