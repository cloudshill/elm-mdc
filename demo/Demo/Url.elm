module Demo.Url exposing
    ( ToolbarPage(..)
    , TopAppBarPage(..)
    , Url(..)
    , fromString
    , fromUrl
    , toString
    )

import Url


type Url
    = StartPage
    | Button
    | Card
    | Checkbox
    | Chips
    | Dialog
    | Drawer
    | DismissibleDrawer
    | ModalDrawer
    | PermanentDrawer
    | Elevation
    | Fabs
    | IconButton
    | ImageList
    | LayoutGrid
    | LinearProgress
    | List
    | RadioButton
    | Ripple
    | Select
    | Menu
    | Slider
    | Snackbar
    | Switch
    | TabBar
    | TextField
    | Theme
    | Toolbar (Maybe ToolbarPage)
    | TopAppBar (Maybe TopAppBarPage)
    | Typography
    | Error404 String


type ToolbarPage
    = DefaultToolbar
    | FixedToolbar
    | MenuToolbar
    | WaterfallToolbar
    | DefaultFlexibleToolbar
    | WaterfallFlexibleToolbar
    | WaterfallToolbarFix


type TopAppBarPage
    = StandardTopAppBar
    | FixedTopAppBar
    | DenseTopAppBar
    | ProminentTopAppBar
    | ShortTopAppBar
    | ShortCollapsedTopAppBar


toString : Url -> String
toString url =
    let
        toolbarCase toolbar =
            case toolbar of
                Nothing ->
                    "#toolbar"

                Just DefaultToolbar ->
                    "#toolbar/default-toolbar"

                Just FixedToolbar ->
                    "#toolbar/fixed-toolbar"

                Just MenuToolbar ->
                    "#toolbar/menu-toolbar"

                Just WaterfallToolbar ->
                    "#toolbar/waterfall-toolbar"

                Just DefaultFlexibleToolbar ->
                    "#toolbar/default-flexible-toolbar"

                Just WaterfallFlexibleToolbar ->
                    "#toolbar/waterfall-flexible-toolbar"

                Just WaterfallToolbarFix ->
                    "#toolbar/waterfall-toolbar-fix-last-row"

        topAppBarCase topAppBar =
            case topAppBar of
                Nothing ->
                    "#top-app-bar"

                Just StandardTopAppBar ->
                    "#top-app-bar/standard"

                Just FixedTopAppBar ->
                    "#top-app-bar/fixed"

                Just DenseTopAppBar ->
                    "#top-app-bar/dense"

                Just ProminentTopAppBar ->
                    "#top-app-bar/prominent"

                Just ShortTopAppBar ->
                    "#top-app-bar/short"

                Just ShortCollapsedTopAppBar ->
                    "#top-app-bar/short-collapsed"
    in
    case url of
        StartPage ->
            "#"

        Button ->
            "#buttons"

        Card ->
            "#cards"

        Checkbox ->
            "#checkbox"

        Chips ->
            "#chips"

        Dialog ->
            "#dialog"

        Drawer ->
            "#drawer"

        DismissibleDrawer ->
            "#dismissible-drawer"

        ModalDrawer ->
            "#modal-drawer"

        PermanentDrawer ->
            "#permanent-drawer"

        Elevation ->
            "#elevation"

        Fabs ->
            "#fab"

        IconButton ->
            "#icon-button"

        ImageList ->
            "#image-list"

        LayoutGrid ->
            "#layout-grid"

        LinearProgress ->
            "#linear-progress"

        List ->
            "#lists"

        RadioButton ->
            "#radio-buttons"

        Ripple ->
            "#ripple"

        Select ->
            "#select"

        Menu ->
            "#menu"

        Slider ->
            "#slider"

        Snackbar ->
            "#snackbar"

        Switch ->
            "#switch"

        TabBar ->
            "#tabbar"

        TextField ->
            "#text-field"

        Theme ->
            "#theme"

        Toolbar toolbar ->
            toolbarCase toolbar

        TopAppBar topAppBar ->
            topAppBarCase topAppBar

        Typography ->
            "#typography"

        Error404 requestedHash ->
            requestedHash


fromUrl : Url.Url -> Url
fromUrl url =
    fromString (Maybe.withDefault "" url.fragment)


fromString : String -> Url
fromString url =
    case url of
        "" ->
            StartPage

        "buttons" ->
            Button

        "cards" ->
            Card

        "checkbox" ->
            Checkbox

        "chips" ->
            Chips

        "dialog" ->
            Dialog

        "drawer" ->
            Drawer

        "dismissible-drawer" ->
            DismissibleDrawer

        "modal-drawer" ->
            ModalDrawer

        "permanent-drawer" ->
            PermanentDrawer

        "elevation" ->
            Elevation

        "fab" ->
            Fabs

        "icon-button" ->
            IconButton

        "image-list" ->
            ImageList

        "layout-grid" ->
            LayoutGrid

        "linear-progress" ->
            LinearProgress

        "lists" ->
            List

        "radio-buttons" ->
            RadioButton

        "ripple" ->
            Ripple

        "select" ->
            Select

        "menu" ->
            Menu

        "slider" ->
            Slider

        "snackbar" ->
            Snackbar

        "switch" ->
            Switch

        "tabbar" ->
            TabBar

        "text-field" ->
            TextField

        "theme" ->
            Theme

        "toolbar" ->
            Toolbar Nothing

        "toolbar/default-toolbar" ->
            Toolbar (Just DefaultToolbar)

        "toolbar/fixed-toolbar" ->
            Toolbar (Just FixedToolbar)

        "toolbar/waterfall-toolbar" ->
            Toolbar (Just WaterfallToolbar)

        "toolbar/default-flexible-toolbar" ->
            Toolbar (Just DefaultFlexibleToolbar)

        "toolbar/waterfall-flexible-toolbar" ->
            Toolbar (Just WaterfallFlexibleToolbar)

        "toolbar/waterfall-toolbar-fix-last-row" ->
            Toolbar (Just WaterfallToolbarFix)

        "top-app-bar" ->
            TopAppBar Nothing

        "top-app-bar/standard" ->
            TopAppBar (Just StandardTopAppBar)

        "top-app-bar/fixed" ->
            TopAppBar (Just FixedTopAppBar)

        "top-app-bar/dense" ->
            TopAppBar (Just DenseTopAppBar)

        "top-app-bar/prominent" ->
            TopAppBar (Just ProminentTopAppBar)

        "top-app-bar/short" ->
            TopAppBar (Just ShortTopAppBar)

        "top-app-bar/short-collapsed" ->
            TopAppBar (Just ShortCollapsedTopAppBar)

        "typography" ->
            Typography

        _ ->
            Error404 url
