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
  ; Enable this so that activating the career skill stops the auto attack.
  ; This is not greatly useful in most cases, so it is disabled.
  ; The continued attack will not prevent the career skill from going off.
  ;*~f::
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

  ; This will switch to the melee weapon before starting the attack.
  Send 1

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
