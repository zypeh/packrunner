module Packrunner (packrunner) where

import Data.List
import System.Environment

import Paths_packrunner (version)
import Data.Version (showVersion)
    
import Packrunner.Pull (pull)

import ConfigReader (readTest)

packrunner :: IO ()
packrunner = do
    args <- getArgs
    case args of
        ["help"] -> usage
        ["version"] -> putStrLn $ unwords prVersion
        ["pull"] -> pull
        ["test"] -> readTest
        _ -> usage
    where
        prVersion = ["Packrunner (prpr)", showVersion version]
    
usage :: IO ()
usage = do
    prog <- getProgName
    putStr . unlines $
        concat ["Usage: ", prog, " [OPTION]"] : [
        "COMMANDS ",
        "    help                Print this message",
        "    version             Print the version number",
        "    pull                Pull from the registry"
        ]
    