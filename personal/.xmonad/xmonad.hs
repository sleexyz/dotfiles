{-# LANGUAGE ScopedTypeVariables #-}
import Data.Function
import Data.Monoid
import System.IO
import XMonad
import XMonad.Actions.DeManage
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.ManageHook
import XMonad.MyCross
import XMonad.MyUpdatePointer
import XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare

main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
  where
    myBar = "xmobar"
    myPP = xmobarPP {
      ppOrder = \(ws:l:t:_)   -> [ws],
      ppSort = fmap (.namedScratchpadFilterOutWorkspace) getSortByTag,
      ppHiddenNoWindows = xmobarColor "grey" "",
      ppTitle   = xmobarColor "green"  "" . shorten 40,
      ppVisible = wrap "(" ")",
      ppCurrent = xmobarColor "#6FB3D2" "" ,
      ppSep = "   ",
      ppWsSep = "    ",
      ppUrgent  = xmobarColor "red" "yellow"
    }
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig =
  def {
    terminal = "termite",
    modMask = mod4Mask,
    handleEventHook = fullscreenEventHook,
    layoutHook = mylayoutHook,
    logHook = myLogHook,
    normalBorderColor = "#252726",
    focusedBorderColor = "#ffffff",
    XMonad.workspaces = myWorkspaces,
    manageHook = myManageHook,
    startupHook = myStartupHook,
    borderWidth = 0
  }
  & (\config -> additionalKeysP config myAdditionalKeysP)
  where
    myScratchPads :: [NamedScratchpad]
    myScratchPads =
      [ NS "term" "termite --title=scratchpad-term" (title=? "scratchpad-term") (customFloating $ W.RationalRect 0 0 1 0.66)
      , NS "keep" "~/.bin/keep" (appName =? "crx_hmjkmjkepdijhoojdojkdfohbdgmmhki") (customFloating $ W.RationalRect 0 0 1 0.66)
      , NS "term-zen" "termite --config=/home/slee2/.config/termite/config-zen --title=scratchpad-term-zen -e 'conversations-with-myself'" (title=? "scratchpad-term-zen") (customFloating $ W.RationalRect 0 0 1 1)
      , NS "term-trans" "termite --config=/home/slee2/.config/termite/config-trans --title=scratchpad-term-trans" (title=? "scratchpad-term-trans") (customFloating $ W.RationalRect 0 0 1 1)
      ]

    myStartupHook :: X ()
    myStartupHook = do
      startupHook def
      spawn "sh ~/.config/xsession.sh"

    myManageHook :: ManageHook
    myManageHook = composeAll [ className =? "Zenity" --> doCenterFloat
                              , className =? "Gimp" --> doCenterFloat
                              , namedScratchpadManageHook myScratchPads
                              ]

    mylayoutHook :: Choose Cross Tall a
    mylayoutHook = simpleCross ||| tiled
        where
            tiled = Tall nmaster delta ratio
            nmaster = 1
            ratio = 1/2
            delta = 3/100

    myLogHook :: X ()
    myLogHook = updatePointer $ Relative 0.5 0.5

    myWorkspaces :: [WorkspaceId]
    myWorkspaces = map show [1 .. 4 :: Int]

    myAdditionalKeysP :: [(String, X ())]
    myAdditionalKeysP =
      [ ("M-m", spawn "echo 'Hi, mom!' | dzen2 -p 4")
      , ("M-`", sendMessage NextLayout)
      , ("M-S-q", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
      , ("M-S-d", withFocused demanage)
      , ("<F1>", namedScratchpadAction myScratchPads "term")
      , ("<F2>", namedScratchpadAction myScratchPads "keep")
      , ("<F3>", namedScratchpadAction myScratchPads "term-zen")
      , ("<F4>", namedScratchpadAction myScratchPads "term-trans")
      , ("M-<Space>", spawn "rofi -show run")
      , ("M-p", spawn "rofi -show run")
      , ("M-<Up>", spawn "transset-df -p --inc 0.03")
      , ("M-<Down>", spawn "transset-df -p --dec 0.03")
      , ("M-S-s", spawn "maim -s -c 1,0,0,0.6 ~/screenshots/$(date +%F-%T).png")

      -- media keys
      , ("<XF86MonBrightnessUp>", spawn "light -A 10")
      , ("<XF86MonBrightnessDown>", spawn "light -U 10")
      , ("<XF86KbdBrightnessUp>", spawn "kbdlight up 10")
      , ("<XF86KbdBrightnessDown>", spawn "kbdlight down 10")

      , ("<XF86AudioMute>", spawn "amixer set Master toggle")
      , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 2db+ unmute")
      , ("<XF86AudioLowerVolume>", spawn "amixer set Master 2db- unmute")
      ]
