# AS-Run-JS
**Run JavaScript code from AssemblyScript**

## Installation

```js
~ npm install as-run-js
```

## Usage

**JS**

```js
...
const loader = require('@assemblyscript/loader')
+ const RunJS = require('as-run-js/imports')
+ const runJS = new RunJS()
const imports = {
+     ...runJS.wasmImports
}
const wasmModule = loader.instantiateSync(..., imports);
+ runJS.wasmExports = wasmModule.exports
...
```

**AssemblyScript**

Access the console
```js
import { runJS } from 'as-run-js'

runJS(`console.log('Hello from as-runJS!')`)
// 'Hello from as-runJS'
```

Write a file

```js
import { runJS } from 'as-run-js'

runJS(`
    const fs = require('fs')
    fs.writeFileSync('./RunJS.txt', 'Hello from as-runJS!')
`)
```

## Safety

This module use `eval()`. I am not responible for any damage caused because of this module. When running on the backend, you need to be wary of backdoors and unwanted access. If your going to be using `fetch()` for your wasm binary, be very cautious when using this module. :)