#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;MsgBox, x64Slayer in da hausssss

s1 := Array("q","q","w","r")
s2 := Array("w","w","w","r")
s3 := Array("w","w","q","r")
a2 := Array("e","e","w","r")
a3 := Array("q","w","e","r")
global skill := Array("AA","BB")
spec := 0

1::
	;execute(s1)
	setSkill("s1")
Return

2::
	execute(s2)
	setSkill("s2")
Return

3::
	execute(s3)
	setSkill("s3")
Return

!2::
	execute(a1)
	setSkill("a2")
Return

!3::
	execute(a2)
	setSkill("a3")
Return

setSkill(sk)
{
	if(seek(skill,sk) != 1){
			skill[2] := skill[1]
			skill[1] := sk
	}
	MsgBox % "s[1] " skill[1] " and s[2] " skill[2]
	Return
}

t::
	Send {Enter}
	Send -refresh
	Send {Enter}
Return

execute(seq)
{
	Loop % seq.Length(){
		SendInput % seq[A_Index]
		Sleep, 100
	}
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