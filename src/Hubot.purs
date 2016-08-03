module Hubot (
    HUBOT
    , Response
    , Robot
    , hear
    , reply
    , respond
    , send
) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Reader.Trans (ReaderT(..))
import Data.String.Regex (Regex)


foreign import data Robot :: *

foreign import data Response :: *

foreign import data HUBOT :: !


foreign import hearInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (hear :: HUBOT | e) Unit

hear :: forall e. Regex -> (Response -> Eff e Unit) -> ReaderT Robot (Eff (hear :: HUBOT | e)) Unit
hear reg cb = ReaderT (hearInternal reg cb)


foreign import respondInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (respond :: HUBOT | e) Unit

respond :: forall e. Regex -> (Response -> Eff e Unit) -> ReaderT Robot (Eff (respond :: HUBOT | e)) Unit
respond reg cb = ReaderT (respondInternal reg cb)


foreign import send :: forall e. String -> Response -> Eff (send :: HUBOT | e) Unit

foreign import reply :: forall e. String -> Response -> Eff (reply :: HUBOT | e) Unit
