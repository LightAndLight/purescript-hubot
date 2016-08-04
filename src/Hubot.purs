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

import Prelude (($), (<<<), Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Aff (Aff, makeAff)
import Control.Monad.Reader.Trans (ReaderT(..))
import Data.Maybe (Maybe(..))
import Data.String.Regex (Regex)


foreign import data Robot :: *

foreign import data Response :: *

foreign import data HUBOT :: !


foreign import matchInternal :: (String -> Maybe String) -> Maybe String -> Response -> Int -> Maybe String

match :: Response -> Int -> Maybe String
match = matchInternal Just Nothing


foreign import hearInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff e Unit

hear :: forall e. Regex -> ReaderT Robot (Aff (hubot :: HUBOT | e)) Response
hear reg = ReaderT $ \robot -> makeAff (\err cb -> hearInternal reg cb robot)


foreign import respondInternal :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff e Unit

respond :: forall e. Regex -> ReaderT Robot (Aff (hubot :: HUBOT | e)) Response
respond reg = ReaderT $ \robot -> makeAff (\err cb -> respondInternal reg cb robot)


foreign import send :: forall e. String -> Response -> Eff (send :: HUBOT | e) Unit

foreign import reply :: forall e. String -> Response -> Eff (reply :: HUBOT | e) Unit
