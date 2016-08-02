module Hubot where

import Prelude
import Control.Monad.Eff (Eff)
import Data.String.Regex (Regex)


foreign import data Robot :: *

foreign import data Response :: *


foreign import data HEAR :: !

foreign import hear :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (hear :: HEAR | e) Unit


foreign import data RESPOND :: !

foreign import respond :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (respond :: RESPOND | e) Unit


foreign import data SEND :: !

foreign import send :: forall e. String -> Response -> Eff (send :: SEND | e) Unit


foreign import data REPLY :: !

foreign import reply :: forall e. String -> Response -> Eff (reply :: REPLY | e) Unit
