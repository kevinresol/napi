var Api = require('./api').api.Api;
var api = new Api();

console.log(api.getString());
console.log(api.getInt());
console.log(api.getFloat());

api.getFuncVV()();
api.getFuncSV()("my input");
api.getFuncSSV()("my input1", "my input2");
console.log(api.getFuncVS()());
console.log(api.getFuncSS()("my input"));
console.log(api.getFuncSSS()("my input1", "my input2"));

api.setFuncVV(function() {console.log("setFuncVV")});
api.setFuncSV(function(s) {console.log("setFuncSV " + s)});
api.setFuncSSV(function(s1, s2) {console.log("setFuncSSV " + s1 + s2)});
api.setFuncVS(function() {return "native ouput"});
api.setFuncSS(function(s) {return "native output " + s});
api.setFuncSSS(function(s1, s2) {return "native input " + s1 + s2});