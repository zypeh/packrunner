module Packrunner.Pull (pull) where

import Data.ByteString.Char8
import Data.Either.Unwrap
import Network.Download (openURI)
    
pull :: IO ()
pull = do 
    src <- openURI "http://google.com"
    Data.ByteString.Char8.putStrLn (fromRight src)
