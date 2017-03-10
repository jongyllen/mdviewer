module Rest exposing (..)

import Http
import Json.Decode as Json exposing (..)
import Types exposing (Msg(..), File)

getFileList : Cmd Msg
getFileList =
    Http.send FetchFileList <|
        Http.get "documents/list.json" decodeFileList

decodeFileList : Json.Decoder (List File)
decodeFileList =
    list <|
        map2 File
            (field "filename" string)
            (field "description" string)


getFile : String -> Cmd Msg
getFile url =
    Http.send FetchFile <|
        Http.getString url
