{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DerivingVia #-}
module TT.Syntax where

import Prelude (Int, Num, Eq, Show)

-- | De Bruijn index 
newtype Ix = Ix Int
  deriving (Eq, Num) via Int
  deriving (Show)

-- | Marker type for terms as binders
newtype Binder a = Binder a
  deriving (Show)

-- | The term and type language
data Term
  = Var Ix
  | Pi Term (Binder Term)
  | Sg Term (Binder Term)
  | Lam (Binder Term)
  | App Term Term
  -- | * Pairs
  | Pair Term Term
  | Fst Term
  | Snd Term
  -- | * Bool
  | Bool
  | True
  | False
  -- | * Boolean induction
  | BoolInd { motive :: Binder Term , tcase :: Term, fcase :: Term, scrut :: Term }
  deriving (Show)

test1, test2 :: Term
test1 = Lam (Binder (Var (Ix 0)))
test2 = App test1 True
 
