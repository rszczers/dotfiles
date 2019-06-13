--------------------------------------------------------------------------------
-- | Example.hs
--
-- Example configuration file for xmonad using the latest recommended
-- features (e.g., 'desktopConfig').
module Main (main) where

--------------------------------------------------------------------------------
import System.Exit
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Util.NamedScratchpad
import XMonad.Layout.BinarySpacePartition (emptyBSP)
import XMonad.Layout.NoBorders (noBorders)
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import XMonad.Prompt.Shell
import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)
import XMonad.StackSet as W
import System.IO (hPutStrLn)
import XMonad.Prompt.Pass
--------------------------------------------------------------------------------

myTerminal = "st"

main = do
  -- spawn "/home/fulgjon/.cabal/bin/xmobar" -- Start a task bar such as xmobar.
  xmproc <- spawnPipe "xmobar"
  -- Start xmonad using the main desktop configuration with a few
  -- simple overrides:
  xmonad $ desktopConfig
    { borderWidth = 2
    , focusedBorderColor = "#1b1B56"
    , normalBorderColor  = "#0B0B16"
    , modMask    = mod4Mask -- Use the "Win" key for the mod key
    , manageHook = myManageHook
               <+> manageHook desktopConfig
               <+> namedScratchpadManageHook scratchpads
    , layoutHook = desktopLayoutModifiers $ myLayouts
    , terminal   = myTerminal
    , logHook    = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        }
    }
    `additionalKeysP` myKeys'
    `additionalKeys` myKeys

myKeys' =
  [ ("M-S-q", confirmPrompt myXPConfig "exit" (io exitSuccess))
  , ("M-d"  , shellPrompt myXPConfig)
  , ("M-S-f", sendMessage (Toggle "Full"))
  , ("M-m", namedScratchpadAction scratchpads "poczta")
  , ("M-n", namedScratchpadAction scratchpads "odsluch")
  , ("M-S-g", namedScratchpadAction scratchpads "newsy")
  , ("M-S-b", namedScratchpadAction scratchpads "kalendarz")
  , ("M-b", namedScratchpadAction scratchpads "manager-plikow")
  ]

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
  [ ((mod4Mask, xK_p)                              , passPrompt myXPConfig)
  , ((mod4Mask .|. controlMask, xK_p)               , passGeneratePrompt myXPConfig)
  , ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
  , ((0, 0x1008FF11), spawn "amixer -q sset Master 2%-")
  , ((0, 0x1008FF13), spawn "amixer -q sset Master 2%+")
  , ((0, 0x1008FF12), spawn "amixer set Master toggle")
  ]

spawnTermApp :: String -> String -> String
spawnTermApp path className' = myTerminal
  ++ " -c " ++ className'
  ++ " -n " ++ className'
  ++ " -e " ++ path

newScratchpad :: String -> String -> NamedScratchpad
newScratchpad path className' =
  NS className' spawnS findS manageS
  where
    spawnS  = spawnTermApp path className'
    findS   = resource =? className'
    manageS = customFloating $ W.RationalRect l t w h
      where
        h = 0.9
        w = 0.9
        t = 0.95 - h
        l = 0.95 - w

scratchpads :: [NamedScratchpad]
scratchpads =
  [ newScratchpad "ncmpcpp"     "odsluch"
  , newScratchpad "newsbeuter"  "newsy"
  , newScratchpad "neomutt"     "poczta"
  , newScratchpad "calcurse"    "kalendarz"
  , newScratchpad "ranger"      "manager-plikow"
  ]

--------------------------------------------------------------------------------
-- | Customize layouts.
--
-- This layout configuration uses two primary layouts, 'ResizableTall'
-- and 'BinarySpacePartition'.  You can also use the 'M-<Esc>' key
-- binding defined above to toggle between the current layout and a
-- full screen layout.
myLayouts = toggleLayouts (noBorders Full) others
  where
    others = ResizableTall 1 (1.5/100) (3/5) [] ||| emptyBSP

--------------------------------------------------------------------------------
-- | Customize the way 'XMonad.Prompt' looks and behaves.  It's a
-- great replacement for dzen.
myXPConfig = def
  { position          = Top
  , alwaysHighlight   = True
  , promptBorderWidth = 0
  , font              = "-*-fixed-*-*-*-*-14-*-*-*-*-*-*-*"
  }

--------------------------------------------------------------------------------
-- | Manipulate windows as they are created.  The list given to
-- @composeOne@ is processed from top to bottom.  The first matching
-- rule wins.
--
-- Use the `xprop' tool to get the info you need for these matches.
-- For className, use the second value that xprop gives you.
myManageHook = composeOne
  [ className =? "Pidgin"  -?> doFloat
  , className =? "XCalc"   -?> doFloat
  , className =? "mpv"     -?> doFloat
  , className =? "mplayer" -?> doFloat
  , isDialog               -?> doCenterFloat

    -- Move transient windows to their parent:
  , transience
  ]
