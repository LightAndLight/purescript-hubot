# purescript-hubot

Hubot bindings for PureScript.

## Installation

```sh
$ bower install lightandlight/purescript-hubot
```

## Usage

1. Write a script

    ```purescript
    -- <purescript_project_path>/src/MyHubotScript.purs
    
    module Main (script) where
    
    import Prelude (($), Unit)
    import Control.Monad.Aff (Aff, launchAff)
    import Control.Monad.Eff (Eff)
    import Control.Monad.Eff.Class (liftEff)
    import Control.Monad.Eff.Console (CONSOLE, log)
    import Data.Either (Either(..))
    import Data.String.Regex (Regex, noFlags, regex)
    
    import Hubot (HUBOT, Robot, hear, send)
    
    script' :: Robot -> Regex -> Aff (hubot :: HUBOT | e) Unit
    script' robot pat = do
        response <- hear pat robot
        liftEff $ send "polo" response
    
    script :: Robot -> Eff (hubot :: HUBOT, console :: CONSOLE) Unit
    script robot = case regex "marco" noFlags of
        Left err -> liftEff $ log err
        Right pat -> do
            launchAff $ script' robot pat
            pure unit
    ```

2. Build your module

    *It's necessary to use browserify directly as pulp browserify doesn't have a `--node` flag yet*

    ```sh
    $ pulp build &&
      cd output/Main/ &&
      browserify -o <hoobot_path>/scripts/lib/my_hubot_script.js -s MyHubotScript --node --no-bundle-external index.js &&
      cd ../../
    ```

3. Add a Hubot script that calls the function you exported
    
    ```coffeescript
    # <hubot_path>/scripts/my_hubot_script.coffee
    
    module.exports = (robot) -> require('./lib/my_hubot_script.js').script(robot)()
    ```
