import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import MyCross
import Data.Monoid
import XMonad.Hooks.DynamicLog
import System.IO

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare
import XMonad.Hooks.ManageHelpers
import XMonad.Util.SpawnOnce


main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- xmobar
myBar = "xmobar"

myPP = xmobarPP { ppOrder = \(ws:l:t:_)   -> [ws]
            , ppSort = fmap (.namedScratchpadFilterOutWorkspace) getSortByTag
            , ppHiddenNoWindows = xmobarColor "grey" ""
            , ppTitle   = xmobarColor "green"  "" . shorten 40
            , ppVisible = wrap "(" ")"
            , ppCurrent = xmobarColor "#6FB3D2" "" 
            , ppSep = "   "
            , ppWsSep = "    "
            , ppUrgent  = xmobarColor "red" "yellow"
            }


-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)




-- myConfig

-- manageHook
myManageHook = ( composeAll 
    [ className =? "Zenity" --> doCenterFloat
    , className =? "Gimp" --> doCenterFloat
    ]
    ) <+> namedScratchpadManageHook myScratchPads

-- then define your scratchpad management separately:
myScratchPads = [ NS "terminal" spawnTerm (resource =? "urxvt-scratchpad") (customFloating $ W.RationalRect 0 0 1 0.66)
                , NS "keep" spawnKeep (resource =? "crx_hmjkmjkepdijhoojdojkdfohbdgmmhki") (customFloating $ W.RationalRect 0 0 1 0.66)
                ]
    where
        spawnTerm = "urxvt -name urxvt-scratchpad"
        spawnKeep = "~/.bin/keep"


-- layoutHook
mylayoutHook = simpleCross ||| tiled
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100




-- Workspaces
myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 4 :: Int]

-- startupHook
myStartupHook = do
  spawnOnce "sh ~/.config/xsession.sh"

-- Key bindings
myAdditionalKeysP = [
  ("M-m", spawn "echo 'Hi, mom!' | dzen2 -p 4"),
  ("M-`", sendMessage NextLayout),
  ("M-S-q", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi"),
  ("<F1>", namedScratchpadAction myScratchPads "terminal"),
  ("<F2>", namedScratchpadAction myScratchPads "keep"),
  ("M-<Space>", spawn "rofi -show run"),
  ("M-p", spawn "rofi -show run"),
  ("M-<Up>", spawn "transset-df -p --inc 0.03"),
  ("M-<Down>", spawn "transset-df -p --dec 0.03")
  ]

myConfig = defaultConfig
    { terminal = "urxvt",
      modMask = mod4Mask,
      handleEventHook = fullscreenEventHook,
      layoutHook = mylayoutHook,
      normalBorderColor = "#252726",
      focusedBorderColor = "#ffffff",
      XMonad.workspaces = myWorkspaces,
      manageHook = myManageHook,
      startupHook = myStartupHook,
      borderWidth = 0
    }
    `additionalKeysP`
    myAdditionalKeysP

