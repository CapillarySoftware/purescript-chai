# Module Documentation

[![Build Status](https://travis-ci.org/CapillarySoftware/purescript-chai.svg?branch=master)](https://travis-ci.org/CapillarySoftware/purescript-chai)
[![Bower version](https://badge.fury.io/bo/purescript-chai.svg)](http://badge.fury.io/bo/purescript-chai)
[![Dependency Status](https://www.versioneye.com/user/projects/547003628101062843000326/badge.svg?style=flat)](https://www.versioneye.com/user/projects/547003628101062843000326)

## Module Test.Chai

### Types

    data Chai :: !

    data Error where
      Error :: Error

    type ErrorExpectation  = forall eff. Expect -> Error -> Eff (chai :: Chai | eff) Unit

    data Expect where
      Expect :: Expect

    type Expectation  = forall a e. Expect -> a -> Eff (chai :: Chai | e) Unit


### Values

    expect :: forall a. a -> Expect

    toBeAbove :: Expectation

    toBeAtLeast :: Expectation

    toBeAtMost :: Expectation

    toBeBelow :: Expectation

    toDeepEqual :: Expectation

    toEql :: Expectation

    toEqual :: Expectation

    toInclude :: Expectation

    toNotBeAbove :: Expectation

    toNotBeAtLeast :: Expectation

    toNotBeAtMost :: Expectation

    toNotBeBelow :: Expectation

    toNotDeepEqual :: Expectation

    toNotEql :: Expectation

    toNotEqual :: Expectation

    toNotInclude :: Expectation

    toNotThrow :: ErrorExpectation

    toThrow :: ErrorExpectation
