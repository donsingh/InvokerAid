#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;MsgBox, x64Slayer in da hausssss

s0 := Array("q","q","w","r")
s1 := Array("w","w","w","r")
s2 := Array("w","w","q","r")
s3 := Array("q","q","e","r")
a1 := Array("e","e","w","r")
a2 := Array("q","w","e","r")
a3 := Array("e","e","q","r")
global skill := Array("AA","BB")
spec := 0

`::
	setSkill("s0")
	execute(s0,"s0")
Return

1::
	setSkill("s1")
	execute(s1,"s1")
Return

2::
	setSkill("s2")
	execute(s2,"s2")
Return

3::
	setSkill("s3")
	execute(s3,"s3")
Return

!1::
	setSkill("a1")
	execute(a1,"a1")
Return

!2::
	setSkill("a2")
	execute(a2,"a2")
Return

!3::
	setSkill("a3")
	execute(a3,"a3")
Return

setSkill(sk)
{
	if(seek(skill,sk) != 1){
			skill[2] := skill[1]
			skill[1] := sk
	}
	Return
}

t::
	BlockInput On
	Send {Enter}
	Send -refresh
	Send {Enter}
	BlockInput Off
Return

execute(seq, trig)
{
	BlockInput On
	Loop % seq.Length(){
		SendInput % seq[A_Index]
		Sleep, 150
	}
	if(trig == "s0"){
		SendInput w
		SendInput w
		SendInput w
	}
	;;
	BlockInput Off
}

count(obj)
{
	c = 0
	Loop % obj.Length(){
		c++
	}
	return c
}

seek(obj, str)
{
	pos = 0
	Loop % obj.Length(){
		if(obj[A_Index] == str){
			return pos+1
		}
		pos++
	}
	return 0
}

#p::
Suspend, Permit
Suspend, Toggle
MsgBox, "Script Toggled"
Return