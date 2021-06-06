export class RunJS {
    constructor() {
        this._exports = null
        this.wasmImports = {
            runJS: {
                runJS: (text) => {
                    eval(this._exports.__getString(text))
                }
            }
        }
    }

    get wasmExports() {
        return this._exports
    }

    set wasmExports(e) {
        this._exports = e
    }

    getFn(fnIndex) {
        if (!this.wasmExports)
            throw new Error(
                'Make sure you set .wasmExports after instantiating the Wasm module but before running the Wasm module.',
            )
        if (!this._exports.table.get) return () => {
            throw new Error('Uh oh! Make sure to add the --exportTable flag to your compile script!')
        }
        return this._exports.table.get(fnIndex)
    }
}