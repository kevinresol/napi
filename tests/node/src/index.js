var Api = require('./api').api.Api;
var api = new Api();

console.log(api.getBool());
console.log(api.getString());
console.log(api.getInt());
console.log(api.getFloat());
console.log(api.getBools());
console.log(api.getStrings());
console.log(api.getInts());
console.log(api.getFloats());

api.getFuncVV()();
api.getFuncSV()("native input");
api.getFuncSSV()("native input1", "native input2");
console.log(api.getFuncVS()());
console.log(api.getFuncSS()("native input"));
console.log(api.getFuncSSS()("native input1", "native input2"));

api.setBool(true);
api.setInt(123);
api.setFloat(1.23);
api.setString('a');
api.setBools([true, false, true]);
api.setInts([123, 234, 345]);
api.setFloats([1.23, 2.34, 3.45]);
api.setStrings(['a', 'b', 'c']);

api.setFuncVV(function() {console.log("setFuncVV")});
api.setFuncSV(function(s) {console.log("setFuncSV " + s)});
api.setFuncSSV(function(s1, s2) {console.log("setFuncSSV " + s1 + s2)});
api.setFuncVS(function() {return "native ouput"});
api.setFuncSS(function(s) {return "native output " + s});
api.setFuncSSS(function(s1, s2) {return "native output " + s1 + s2});

console.log('Done');