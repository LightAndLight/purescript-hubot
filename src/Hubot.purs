module Hubot (
    HUBOT
    , Response
    , Robot
    , hear
    , http
    , match
    , reply
    , respond
    , send
) where

import Prelude (($), (<<<), Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Aff (Aff, makeAff)
import Data.Maybe (Maybe(..))
import Data.String.Regex (Regex)
import Node.HTTP.ScopedClient (ScopedClient)
import Node.HTTP (HTTP)

foreign import data Robot :: *

foreign import data Response :: *

foreign import data HUBOT :: !


foreign import http :: forall e. String -> Robot -> Eff (http :: HTTP | e) ScopedClient


foreign import matchInternal :: (String -> Maybe String) -> Maybe String -> Response -> Int -> Maybe String

match :: Response -> Int -> Maybe String
match = matchInternal Just Nothing


foreign import hearInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff e Unit

hear :: forall e. Regex -> Robot -> Aff (hubot :: HUBOT | e) Response
hear reg robot = makeAff $ \err cb -> hearInternal reg cb robot


foreign import respondInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff e Unit

respond :: forall e. Regex -> Robot -> Aff (hubot :: HUBOT | e) Response
respond reg robot = makeAff $ \err cb -> respondInternal reg cb robot


foreign import send :: forall e. String -> Response -> Eff (hubot :: HUBOT | e) Unit

foreign import reply :: forall e. String -> Response -> Eff (hubot :: HUBOT | e) Unit
