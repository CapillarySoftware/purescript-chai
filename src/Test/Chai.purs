module Test.Chai
  ( Chai(..), Error(..)
  , expect, Expect(..), Expectation(..)
  , toEqual, toNotEqual
  , toDeepEqual, toNotDeepEqual, toEql, toNotEql
  , toBeAbove, toNotBeAbove, toBeAtLeast, toNotBeAtLeast
  , toBeBelow, toNotBeBelow, toBeAtMost, toNotBeAtMost
  , toInclude, toNotInclude
  , toThrow, toNotThrow, toBeOk, toNotBeOk, ErrorExpectation(..)) where

import Control.Monad.Eff
import Data.Foreign.EasyFFI

foreign import data Chai :: !
data Expect              = Expect
data Error               = Error 

foreign import chai
  """var chai = (function() {
    if (typeof window === 'undefined') {
      // this is Node.js
      return require('chai');
    } else {
      // in the browser; `chai` should already be defined on `window`
      return window.chai;
    }
  })()"""
  :: forall a. a

expect                   :: forall a. a -> Expect
expect                   = unsafeForeignFunction ["chai", "source"] "chai.expect(source)" $ chai

type Expectation         = forall a e. Expect -> a -> Eff (chai :: Chai | e) Unit
bindExpectation        x = unsafeForeignProcedure ["expect", "target", ""] $ "expect." ++ x ++ "(target)"

toEqual                  :: Expectation
toEqual                  = bindExpectation "to.equal"
toNotEqual               :: Expectation
toNotEqual               = bindExpectation "to.not.equal"

toDeepEqual              :: Expectation
toDeepEqual              = bindExpectation "to.deep.equal"
toNotDeepEqual           :: Expectation
toNotDeepEqual           = bindExpectation "to.not.deep.equal"

toEql                    :: Expectation
toEql                    = bindExpectation "to.eql"
toNotEql                 :: Expectation
toNotEql                 = bindExpectation "to.not.eql"

toBeAbove                :: Expectation
toBeAbove                = bindExpectation "to.be.above"
toNotBeAbove             :: Expectation
toNotBeAbove             = bindExpectation "to.not.be.above"

toBeAtLeast              :: Expectation
toBeAtLeast              = bindExpectation "to.be.at.least"
toNotBeAtLeast           :: Expectation
toNotBeAtLeast           = bindExpectation "to.not.be.at.least"

toBeBelow                :: Expectation
toBeBelow                = bindExpectation "to.be.below"
toNotBeBelow             :: Expectation
toNotBeBelow             = bindExpectation "to.not.be.below"

toBeAtMost               :: Expectation
toBeAtMost               = bindExpectation "to.be.at.most"
toNotBeAtMost            :: Expectation
toNotBeAtMost            = bindExpectation "to.not.be.at.most"

toInclude                :: Expectation
toInclude                = bindExpectation "to.include"
toNotInclude             :: Expectation
toNotInclude             = bindExpectation "to.not.include"

toBeOk                   :: forall e. Expect -> Eff (chai :: Chai|e) Unit
toBeOk                  x  = unsafeForeignProcedure ["expect", ""] $ "expect.to.be.ok"


toNotBeOk                :: forall e. Expect -> Eff (chai :: Chai|e) Unit
toNotBeOk               x  = unsafeForeignProcedure ["expect", ""] $ "expect.to.not.be.ok"

type ErrorExpectation    = forall eff. Expect -> Error -> Eff (chai :: Chai | eff) Unit

toThrow                  :: ErrorExpectation
toThrow                  = unsafeForeignProcedure ["expect", "", ""] "expect.to.throw(Error)"
toNotThrow               :: ErrorExpectation
toNotThrow               = unsafeForeignProcedure ["expect", "", ""] "expect.to.not.throw(Error)"


