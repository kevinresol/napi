package napi.types;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;

using tink.MacroApi;

class Macro {
	public static function buildFunction() {
		
		switch Context.getLocalType() {
			case TInst(_, [TFun(args, ret)]):
				var argcts = args.map(function(arg) return arg.t.toComplex());
				return switch ret.getID() {
					case 'Void':
						var tp = 'napi.types.Function.Action_' + args.length;
						 TPath(tp.asTypePath(argcts.map(function(ct) return TPType(ct))));
					default:
						var tp = 'napi.types.Function.Func_' + args.length;
						argcts.push(ret.toComplex());
						TPath(tp.asTypePath(argcts.map(function(ct) return TPType(ct))));
				}
			default:
		}
		throw 'Unsupported';
	}
}