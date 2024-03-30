push.s "inputaction_shellworks_openmenu"@3382
conv.s.v
push.i gml_Script_InputAction
conv.i.v
call.i @@NewGMLObject@@(argc=2)
pop.v.v global.inputaction_shellworks_openmenu
pushglb.v global.inputaction_shellworks_openmenu
pushi.e 0
conv.i.v
pushi.e 115
conv.i.v
dup.v 2 8 ;;; this is a weird GMS2.3+ swap instruction
dup.v 0
push.v stacktop.AddTrigger
callv.v 2
popz.v
exit.i