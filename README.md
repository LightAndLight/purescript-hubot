# purescript-hubot

Hubot bindings for PureScript.

## Installation

```sh
$ bower install krdlab/purescript-hubot
```

## Usage

1. Write a script

```purescript
-- <purescript_project_path>/src/MyHubotScipt.purs

module MyHubotScript (script) where

import Prelude (($), Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Reader.Trans (runReaderT)
import Data.Either (Either(..))
import Data.String.Regex (noFlags, regex)

import Hubot (HUBOT, Robot, hear, send)

script :: Robot -> Eff (hear :: HUBOT, send :: HUBOT, console :: CONSOLE) Unit
script = runReaderT $ case regex "marco" noFlags of
    Left err -> liftEff $ log err
    Right pat -> hear pat $ send "polo"
```

2. Build your module

```sh
$ pulp browserify -O --standalone MyHubotScript --skip-entry-point --to <hubot_path>/scripts/lib/my_hubot_script.js
```

3. Add a Hubot script that calls the function you exported

```coffeescript
# <hubot_path>/scripts/my_hubot_script.coffee

module.exports = (robot) -> require('./lib/my_hubot_script.js).script(robot)()
```
