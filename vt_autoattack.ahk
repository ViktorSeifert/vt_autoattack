SetTitleMatchMode, RegEx
#IfWinActive (Dark|Vermin)tide

#MaxThreadsPerHotkey, 3

  F9::
    Hotkey, c, AutoAttack, off
    Return

  F10::
    Hotkey, c, AutoAttack, on
    Return

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
  *~r::
  *~t::
  *~x::
  *~Shift::
  ; Enable this so that activating the career skill stops the auto attack.
  ; This is not greatly useful in most cases, so it is disabled.
  ; The continued attack will not prevent the career skill from going off.
  ;*~f::
  ;*~XButton2::
    KeepAttacking := False
    Return

; Main loop to keep attacking (spam clicking LMB)
AutoAttack:
  if KeepAttacking
  {
    KeepAttacking := false
    return
  }

  KeepAttacking := true

  #MaxThreadsPerHotkey, 1
  ; This will switch to the melee weapon before starting the attack.
  ; Send 1

  while KeepAttacking
  {
    Send {Click}
    Sleep, 100

    IfWinNotActive (Dark|Vermin)tide
    {
      Break
    }
  }
  KeepAttacking := false
  return
