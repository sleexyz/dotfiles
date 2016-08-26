{-# LANGUAGE ScopedTypeVariables #-}

import Data.Monoid
import System.IO
import Data.Function
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad
import XMonad.Util.WorkspaceCompare
import XMonad.Hooks.ManageHelpers
import XMonad.Util.SpawnOnce
import XMonad.Actions.DeManage
import XMonad.Layout.Spacing

import MyCross
import MyUpdatePointer


main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
  where
    myBar = "xmobar"
    myPP = xmobarPP { ppOrder = \(ws:l:t:_)   -> [ws],
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



-- myConfig :: XConfig (Choose Cross Tall)
myConfig =
  def { terminal = "urxvt",
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
  -- & ewmh
  where
    myScratchPads :: [NamedScratchpad]
    myScratchPads =
      [ NS "term1" "urxvt -name urxvt-scratchpad1" (resource =? "urxvt-scratchpad1") (customFloating $ W.RationalRect 0 0 1 0.66)
      , NS "term2" "theme transdark && themed big urxvt -name urxvt-scratchpad2" (resource =? "urxvt-scratchpad2") (customFloating $ W.RationalRect 0 0 1 1)
      , NS "keep" "~/.bin/keep" (resource =? "crx_hmjkmjkepdijhoojdojkdfohbdgmmhki") (customFloating $ W.RationalRect 0 0 1 0.66)
      ]

    myStartupHook :: X ()
    myStartupHook = spawnOnce "sh ~/.config/xsession.sh"

    myManageHook :: ManageHook
    myManageHook = composeAll [ className =? "Zenity" --> doCenterFloat
                              , className =? "Gimp" --> doCenterFloat
                              , namedScratchpadManageHook myScratchPads
                              ]

    -- mylayoutHook :: Choose Cross Tall a
    mylayoutHook = simpleCross ||| tiled
        where
            tiled = smartSpacing 10 $ Tall nmaster delta ratio
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
      , ("<F1>", namedScratchpadAction myScratchPads "term1")
      , ("<F2>", namedScratchpadAction myScratchPads "keep")
      , ("M-<Space>", spawn "rofi -show run")
      , ("M-p", spawn "rofi -show run")
      , ("M-<Up>", spawn "transset-df -p --inc 0.03")
      , ("M-<Down>", spawn "transset-df -p --dec 0.03")

      -- media keys
      , ("<XF86MonBrightnessUp>", spawn "light -A 10")
      , ("<XF86MonBrightnessDown>", spawn "light -U 10")
      , ("<XF86KbdBrightnessUp>", spawn "kbdlight up 10")
      , ("<XF86KbdBrightnessDown>", spawn "kbdlight down 10")

      , ("<XF86AudioMute>", spawn "amixer set Master toggle")
      , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 2db+ unmute")
      , ("<XF86AudioLowerVolume>", spawn "amixer set Master 2db- unmute")
      ]
