{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module ConfigReader (readTest) where

import Dhall

data Example = Example {
    foo :: Integer,
    bar :: Vector Double
} deriving (Generic, Show)

instance Interpret Example

readTest :: IO ()
readTest = do
    x <- input auto "~/Desktop/config"
    print (x :: Example)
