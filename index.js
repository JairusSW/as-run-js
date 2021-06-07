const fs = require("fs");
const loader = require("@assemblyscript/loader");
const RunJS = require("./imports");
const runJS = new RunJS();
const imports = {
  ...runJS.wasmImports,
};
const wasmModule = loader.instantiateSync(
  fs.readFileSync(__dirname + "/build/untouched.wasm"),
  imports
);

runJS.wasmExports = wasmModule.exports;
wasmModule.exports.test()
module.exports = wasmModule.exports;