(module
 (type $i32_=>_none (func (param i32)))
 (type $none_=>_none (func))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (import "runJS" "runJS" (func $assembly/runJS/runJS (param i32)))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $~lib/memory/__data_end i32 (i32.const 124))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 16508))
 (global $~lib/memory/__heap_base i32 (i32.const 16508))
 (memory $0 1)
 (data (i32.const 12) "l\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00V\00\00\00\0d\00\n\00 \00 \00 \00 \00 \00 \00 \00 \00c\00o\00n\00s\00o\00l\00e\00.\00l\00o\00g\00(\00\'\00H\00e\00l\00l\00o\00 \00W\00o\00r\00l\00d\00!\00\'\00)\00\0d\00\n\00 \00 \00 \00 \00\00\00\00\00\00\00")
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
   i32.const 16528
   i32.const 16576
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
