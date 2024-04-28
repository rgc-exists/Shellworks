push.s "#KEYBIND_NAME#"@3382
conv.s.v
push.i gml_Script_InputAction
conv.i.v
call.i @@NewGMLObject@@(argc=2)
pop.v.v global.#KEYBIND_NAME#
pushglb.v global.#KEYBIND_NAME#
pushi.e 0
conv.i.v
pushi.e #DEFAULTKEYBIND#
conv.i.v
dup.v 2 8 ;;; this is a weird GMS2.3+ swap instruction
dup.v 0
push.v stacktop.AddTrigger
callv.v 2
popz.v
exit.i