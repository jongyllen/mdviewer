module State exposing (..)

import Types exposing (..)
import Rest


init : (Model, Cmd Msg)
init =
    initialModel ! [ Rest.getFileList ]


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        FetchFileList (Ok fileList) ->
            { model | files = fileList } ! []

        FetchFileList (Err _) ->
            model ! []

        FetchFile (Ok filecontent) ->
            { model | selectedContent = Just filecontent } ! []

        FetchFile (Err _) ->
            { model | selectedContent = Just "Error getting content" } ! []

        FetchFileClick url ->
            let
              fullUrl =  "documents/" ++ url
            in
              model ! [Rest.getFile fullUrl]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
