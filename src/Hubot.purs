module Hubot (
    HUBOT
    , Response
    , Robot
    , hear
    , match
    , reply
    , respond
    , send
) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Reader.Trans (ReaderT(..))
import Data.Maybe (Maybe(..))
import Data.String.Regex (Regex)


foreign import data Robot :: *

foreign import data Response :: *

foreign import data HUBOT :: !

foreign import matchInternal :: (String -> Maybe String) -> Maybe String -> Response -> Int -> Maybe String

match :: Response -> Int -> Maybe String
match = matchInternal Just Nothing

foreign import hearInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (hubot :: HUBOT | e) Unit

hear :: forall e. Regex -> (Response -> Eff e Unit) -> ReaderT Robot (Eff (hubot :: HUBOT | e)) Unit
hear reg cb = ReaderT (hearInternal reg cb)


foreign import respondInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (hubot :: HUBOT | e) Unit

respond :: forall e. Regex -> (Response -> Eff e Unit) -> ReaderT Robot (Eff (hubot :: HUBOT | e)) Unit
respond reg cb = ReaderT (respondInternal reg cb)


foreign import send :: forall e. String -> Response -> Eff (send :: HUBOT | e) Unit

foreign import reply :: forall e. String -> Response -> Eff (reply :: HUBOT | e) Unit
