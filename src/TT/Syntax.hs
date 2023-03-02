{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE DerivingVia #-}
module TT.Syntax where

import Prelude (Int, Num, Eq)

-- | De Bruijn index 
newtype Ix = Ix Int
  deriving (Eq, Num) via Int

-- | Marker type for terms as binders
newtype Binder a = Binder a

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

 
