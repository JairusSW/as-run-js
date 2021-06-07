// @ts-ignore
@external('runJS', 'runJS')
export declare function runJS(text: string): void
export function test(): void {
    runJS(`
        console.log('Hello World!')
    `)
}