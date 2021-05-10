#IfWinActive Vermintide

#MaxThreadsPerHotkey, 3

; List of keys to cancel the auto-attacking.
; These will be "let through" to the game.
; If you have other keybindings extend the list to include them.
; Keep the *~ prefix then just add your key and finish with :: .
  *~1::
  *~2::
  *~3::
  *~4::
  *~5::
  *~LButton::
  *~RButton::
  *~MButton::
  *~WheelDown::
  *~WheelUp::
  *~WheelLeft::
  *~WheelRight::
  *~XButton1::
  *~XButton2::
  *~r::
  *~f::
  *~t::
  KeepAttacking := False
  Return

; Main loop to keep attacking (spam clicking LMB)
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
