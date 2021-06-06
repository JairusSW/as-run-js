// @ts-ignore
@external('runJS', 'runJS')
export declare function runJS(text: string): void
export function test(): void {
    runJS(`
const fs = require('fs')
fs.writeFileSync('./RunJS.txt', 'Hello from as-runJS! 😀')
`)
}