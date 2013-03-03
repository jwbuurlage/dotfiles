import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar /home/jw/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                            { ppOutput = hPutStrLn xmproc
                            , ppOrder               = \(ws:_:_:_)   -> [ws]
                            , ppWsSep               = " . "
                            , ppSep                 = ""
                            , ppCurrent             = xmobarColor "#ffffff" "#333333" . wrap " " "  "
                            }
        , modMask = mod4Mask
        , workspaces = ["code", "chat", "browser", "term", "steam"] ++ map show [ 6 .. 9 :: Int ]
        }

