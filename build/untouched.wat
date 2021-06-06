(module
 (type $i32_=>_none (func (param i32)))
 (type $none_=>_none (func))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (import "runJS" "runJS" (func $assembly/runJS/runJS (param i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~lib/memory/__data_end i32 (i32.const 220))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 16604))
 (global $~lib/memory/__heap_base i32 (i32.const 16604))
 (memory $0 1)
 (data (i32.const 12) "\cc\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\b0\00\00\00\0d\00\n\00c\00o\00n\00s\00t\00 \00f\00s\00 \00=\00 \00r\00e\00q\00u\00i\00r\00e\00(\00\'\00f\00s\00\'\00)\00\0d\00\n\00f\00s\00.\00w\00r\00i\00t\00e\00F\00i\00l\00e\00S\00y\00n\00c\00(\00\'\00.\00/\00R\00u\00n\00J\00S\00.\00t\00x\00t\00\'\00,\00 \00\'\00H\00e\00l\00l\00o\00 \00f\00r\00o\00m\00 \00a\00s\00-\00r\00u\00n\00J\00S\00!\00 \00=\d8\00\de\'\00)\00\0d\00\n\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (table $0 1 funcref)
 (elem $0 (i32.const 1))
 (export "test" (func $assembly/runJS/test))
 (export "memory" (memory $0))
 (export "runJS" (func $export:assembly/runJS/runJS))
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__data_end
  i32.lt_s
  if
   i32.const 16624
   i32.const 16672
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $assembly/runJS/test
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  i32.const 32
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/runJS/runJS
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
 (func $export:assembly/runJS/runJS (param $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $assembly/runJS/runJS
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
