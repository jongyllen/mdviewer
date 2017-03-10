module Types exposing(..)

import Http

type alias Model =
    { files : List File,
      selectedContent : String
    }

type Msg
    = FetchFileList (Result Http.Error (List File))
    | FetchFileClick String
    | FetchFile (Result Http.Error String)

type alias File =
    { filename : String
    , description : String
    }

initialModel : Model
initialModel =
    Model [] ""
