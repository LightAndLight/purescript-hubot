module Hubot where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (class MonadEff)
import Control.Monad.Reader.Class (class MonadReader)
import Data.String.Regex (Regex)


foreign import data Robot :: *

foreign import data Response :: *

foreign import data HUBOT :: !

foreign import hear :: forall e m. (MonadReader Robot m, MonadEff (hear :: HUBOT | e) m) => Regex -> (Response -> Eff e Unit) -> m Unit

foreign import respond :: forall e m. (MonadReader Robot m, MonadEff (respond :: HUBOT | e) m) => Regex -> (Response -> Eff e Unit) -> m Unit

foreign import send :: forall e. String -> Response -> Eff (send :: HUBOT | e) Unit

foreign import reply :: forall e. String -> Response -> Eff (reply :: HUBOT | e) Unit
