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



myManageHook = ( composeAll 
    [ className =? "Zenity" --> doCenterFloat
    , className =? "Gimp" --> doCenterFloat
    ]
    ) <+> namedScratchpadManageHook myScratchPads

-- then define your scratchpad management separately:
myScratchPads = [ NS "terminal" spawnTerm (resource =? "urxvt-scratchpad") (customFloating $ W.RationalRect 0 0 1 1)
                , NS "emacs" spawnEmacs (resource =? "emacs-scratchpad") (customFloating $ W.RationalRect 0 0 1 1)
                ]
    where
        spawnTerm = "urxvt -name urxvt-scratchpad"
        spawnEmacs = "emacs --name emacs-scratchpad"


mylayoutHook = simpleCross ||| tiled
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- -- Custom PP, configure it as you like. It determines what is being written to the bar.
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

myWorkspaces :: [WorkspaceId]
myWorkspaces = map show [1 .. 4 :: Int]

myConfig = defaultConfig
    { terminal = "urxvt"
    , modMask = mod1Mask
    , handleEventHook = fullscreenEventHook
    , layoutHook = mylayoutHook
    , normalBorderColor = "#252726"
    , focusedBorderColor = "#ffffff"
    , XMonad.workspaces = myWorkspaces
    , manageHook = myManageHook
    , borderWidth = 0
    }
    `additionalKeysP`
    [ ("M-m", spawn "echo 'Hi, mom!' | dzen2 -p 4")
    , ("M-q", sendMessage NextLayout)
    , ("M-S-q", spawn "if type xmonad; then xmonad --recompile && xmonad --restart; else xmessage xmonad not in \\$PATH: \"$PATH\"; fi")
    , ("<F1>", namedScratchpadAction myScratchPads "terminal")
    , ("<F2>", namedScratchpadAction myScratchPads "emacs")
    , ("M-<Space>", spawn "rofi -show run")
    , ("M-p", spawn "rofi -show run")
    , ("M-<Up>", spawn "transset-df -p --inc 0.03")
    , ("M-<Down>", spawn "transset-df -p --dec 0.03")
    ]

