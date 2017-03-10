module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Markdown exposing (..)

import Types exposing (Model, Msg(..), File)


rootView : Model -> Html Msg
rootView model =
    div []
  [ nav [ class "navbar navbar-inverse navbar-fixed-top" ]
    [ div [ class "container-fluid" ]
      [ div [ class "navbar-header" ]
        [ button [ attribute "aria-controls" "navbar", attribute "aria-expanded" "false", class "navbar-toggle collapsed", attribute "data-target" "#navbar", attribute "data-toggle" "collapse" ]
          [ span [ class "sr-only" ]
            [ text "Toggle navigation" ]
          , span [ class "icon-bar" ]
            []
          , span [ class "icon-bar" ]
            []
          , span [ class "icon-bar" ]
            []
          ]
        , a [ class "navbar-brand", href "#" ]
          [ text "Documents" ]
        ]
      ]
    ]
  , div [ class "container-fluid" ]
    [ div [ class "row" ]
      [ div [ class "col-sm-3 col-md-2 sidebar" ]
        [ ul [ class "nav nav-sidebar" ] <|
            List.map (viewFileEntry model) model.files
        ]
        , Markdown.toHtml [class "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"] model.selectedContent 
      ]
    ]
  ]
  
viewFileEntry : Model -> File -> Html Msg
viewFileEntry model file =
    li [ onClick (FetchFileClick file.filename) ]
        [ a [ href "#" ]
            [ text file.description ]
        ]

