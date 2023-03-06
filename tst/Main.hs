{-# LANGUAGE NoImplicitPrelude #-}
module Main (main) where

import Prelude (IO, print)
import TT.Syntax
import TT.Eval
import qualified TT.Semantics as V


gamma :: V.Env
gamma = V.Extend (V.Extend (V.Extend V.Empty V.True) V.False) V.True

main :: IO ()
main = do
  print (eval gamma test1)
  print (eval gamma test2)
  print (eval gamma test3)
  
test1, test2, test3 :: Term
test1 = Lam (Binder (Var (Ix 0)))
test2 = App test1 True
test3 = App test1 False

