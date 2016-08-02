module Hubot where

import Prelude
import Control.Monad.Eff (Eff)
import Data.String.Regex (Regex)


foreign import data Robot :: *

foreign import data Response :: *

foreign import data HUBOT :: !

foreign import hear :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (hear :: HUBOT | e) Unit

foreign import respond :: forall e. Regex -> (Response -> Eff e Unit) -> Robot -> Eff (respond :: HUBOT | e) Unit

foreign import send :: forall e. String -> Response -> Eff (send :: HUBOT | e) Unit

foreign import reply :: forall e. String -> Response -> Eff (reply :: HUBOT | e) Unit
