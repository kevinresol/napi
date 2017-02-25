package napi.types;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;

using tink.MacroApi;

class Macro {
	public static function buildNative() {
		switch Context.getLocalType() {
			case TInst(_, [p]):
				return switch p {
					case TFun(_):
						TPath('napi.types.Function'.asTypePath([TPType(p.toComplex())]));
					case TInst(_.get() => {name: 'Array'}, [p]):
						TPath('napi.types.Array'.asTypePath([TPType(native(p))]));
					case TAbstract(_.get() => {name: 'Map'}, [_.getID() => 'String', v]):
						TPath('napi.types.Map.StringMap'.asTypePath([TPType(native(v))]));
					default: 
						p.toComplex();
				}
			default: throw 'assert';
		}
	}
	
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
			default: throw 'assert';
		}
	}
	
	static function native(p:Type) {
		return TPath('napi.types.Native'.asTypePath([TPType(p.toComplex())]));
	}
}