#IfWinActive Vermintide
#MaxThreadsPerHotkey, 3
c::
#MaxThreadsPerHotkey, 1
if KeepAttacking
{
  KeepAttacking := false
  return
}
KeepAttacking := true
while KeepAttacking
{
  Send {Click}
  Sleep, 100

  IfWinNotActive Vermintide
  {
    Break
  }
}
KeepAttacking := false
return