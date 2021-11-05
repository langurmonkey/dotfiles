## My qutebrowser config file
import os
home = os.environ['HOME']

import qutebrowser
qutebrowser_version = qutebrowser.__version_info__


## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
## Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save' }

c.aliases.update({'gmail': 'open -t mail.google.com'})
c.aliases.update({'mail': 'open -t login.mailbox.org'})
c.aliases.update({'arimail': 'open -t mail.ari.uni-heidelberg.de'})
c.aliases.update({'github': 'open -t github.com'})
c.aliases.update({'gitlab': 'open -t gitlab.com'})
c.aliases.update({'netflix': 'open -t netflix.com'})
c.aliases.update({'gaia': 'open -t cosmos.esa.int/web/gaia'})
c.aliases.update({'cosmos': 'open -t cosmos.esa.int/web/gaia'})
c.aliases.update({'jira': 'open -t issues.cosmos.esa.int/gaia'})
c.aliases.update({'twitter': 'open -t twitter.com'})
c.aliases.update({'tw': 'open -t twitter.com'})
c.aliases.update({'tweetdeck': 'open -t tweetdeck.twitter.com'})
c.aliases.update({'td': 'open -t tweetdeck.twitter.com'})
c.aliases.update({'md': 'open -t mastodont.cat'})
c.aliases.update({'yt': 'open -t youtube.com/results?search_query='})
c.aliases.update({'imdb': 'open -t https://www.imdb.com/find?q='})
c.aliases.update({'iu': 'open -t yewtu.be/search?q='})
c.aliases.update({'pt': 'open -t tube.privacytools.io/search?search='})
c.aliases.update({'ht': 'open -t hooktube.com/results?search_query='})
c.aliases.update({'reddit': 'open -t old.reddit.com'})
c.aliases.update({'rd': 'open -t old.reddit.com'})
c.aliases.update({'tr': 'open -t https://libretranslate.com'})
c.aliases.update({'ger': 'open -t https://dict.leo.org/german-english/'})
c.aliases.update({'cal': 'open -t https://office.mailbox.org/appsuite/#!!&app=io.ox/calendar&folder=cal://0/31&perspective=week:workweek'})
c.aliases.update({'calendar': 'open -t https://office.mailbox.org/appsuite/#!!&app=io.ox/calendar&folder=cal://0/31&perspective=week:workweek'})
c.aliases.update({'cat': 'open -t ccma.cat/catradio/directe/catalunya-radio'})
c.aliases.update({'tv3': 'open -t ccma.cat/tv3/directe/tv3'})
c.aliases.update({'map': 'open -t www.openstreetmap.org'})
c.aliases.update({'maps': 'open -t www.openstreetmap.org'})
c.aliases.update({'osm': 'open -t www.openstreetmap.org'})
c.aliases.update({'gmap': 'open -t maps.google.com'})
c.aliases.update({'gmaps': 'open -t maps.google.com'})
c.aliases.update({'sync': 'open -t localhost:8384'})
c.aliases.update({'pihole': 'open -t 192.168.0.31/admin'})
c.aliases.update({'drive': 'open -t https://heibox.uni-heidelberg.de/accounts/login/?next=/'})
c.aliases.update({'heibox': 'open -t https://heibox.uni-heidelberg.de/accounts/login/?next=/'})
c.aliases.update({'heiconf': 'open -t https://heiconf.uni-heidelberg.de'})
c.aliases.update({'nas': 'open -t http://192.168.0.26:8080'})
c.aliases.update({'nasout': 'open -t qlink.to/jumpinglangur'})
c.aliases.update({'ipfs': 'open -t localhost:5001/webui'})
c.aliases.update({"clean" : "spawn --userscript readability-js"})
# Toggle javascript
c.aliases.update({"tjs" : "config-cycle content.javascript.enabled"})
# Disable javascript
c.aliases.update({"djs" : "set content.javascript.enabled false"})
# Enable javascript
c.aliases.update({"ejs" : "set content.javascript.enabled true"})


## Width (in pixels) of the scrollbar in the completion window.
## Type: Int
c.completion.scrollbar.width = 16

## Which cookies to accept.
## Type: String
## Valid values:
##   - all: Accept all cookies.
##   - no-3rdparty: Accept cookies from the same origin only.
##   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain.
##   - never: Don't accept cookies at all.
c.content.cookies.accept = 'no-3rdparty'

## Store cookies. Note this option needs a restart with QtWebEngine on Qt
## < 5.9.
## Type: Bool
c.content.cookies.store = True

## Default encoding to use for websites. The encoding must be a string
## describing an encoding such as _utf-8_, _iso-8859-1_, etc.
## Type: String
c.content.default_encoding = 'utf-8'

## Allow websites to request geolocations.
## Type: BoolAsk
## Valid values:
##   - true
##   - false
##   - ask
c.content.geolocation = 'ask'

## Value to send in the `Accept-Language` header.
## Type: String
c.content.headers.accept_language = 'en-US,en,es,de'

## Custom headers for qutebrowser HTTP requests.
## Type: Dict
# c.content.headers.custom = {}

## Value to send in the `DNT` header. When this is set to true,
## qutebrowser asks websites to not track your identity. If set to null,
## the DNT header is not sent at all.
## Type: Bool
c.content.headers.do_not_track = True

## When to send the Referer header. The Referer header tells websites
## from which website you were coming from when visting them.
## Type: String
## Valid values:
##   - always: Always send the Referer.
##   - never: Never send the Referer. This is not recommended, as some sites may break.
##   - same-domain: Only send the Referer for the same domain. This will still protect your privacy, but shouldn't break any sites.
c.content.headers.referer = 'same-domain'

## Allow pdf.js to view PDF files in the browser. Note that the files can
## still be downloaded by clicking the download button in the pdf.js
## viewer.
## Type: Bool
c.content.pdfjs = True

## Proxy to use. In addition to the listed values, you can use a
## `socks://...` or `http://...` URL.
## Type: Proxy
## Valid values:
##   - system: Use the system wide proxy.
##   - none: Don't use any proxy
#c.content.proxy = 'socks://localhost:9050/'
c.content.proxy = 'system'

## Validate SSL handshakes.
## Type: BoolAsk
## Valid values:
##   - True
##   - False
##   - ask
##   - ask-block-thirdparty
c.content.tls.certificate_errors = 'ask-block-thirdparty'

## Notifications provider.
## Valid values:
##   - auto
##   - qt
##   - libnotify
##   - systray
##   - messages
##   - herbe
c.content.notifications.presenter = 'auto'

## List of user stylesheet filenames to use.
## Type: List of File, or File
c.content.user_stylesheets = [ "scrollbar.css" ]

## Adblocking
##
##
c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://easylist-downloads.adblockplus.org/easylistdutch.txt', 'https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt', 'https://www.i-dont-care-about-cookies.eu/abp/', 'https://secure.fanboy.co.nz/fanboy-cookiemonster.txt']

## Editor (and arguments) to use for the `open-editor` command. The
## following placeholders are defined: * `{file}`: Filename of the file
## to be edited. * `{line}`: Line in which the caret is found in the
## text. * `{column}`: Column in which the caret is found in the text. *
## `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
## Same as `{column}`, but starting from index 0.
## Type: ShellCommand
c.editor.command = ['vim', '-f', '{file}', '-c', 'normal {line}G{column0}l']

## Default default_family fonts. Whenever "default_family" is used in a font
## setting, it's replaced with the fonts listed here.
## Type: Font
c.fonts.default_size = '10pt'
c.fonts.default_family = ["JetBrainsMono Nerd Font"]


## CSS border value for hints.
## Type: String
c.hints.border = '2px solid #000000'

## When to show the scrollbar.
## Type: String
## Valid values:
##   - always: Always show the scrollbar.
##   - never: Never show the scrollbar.
##   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
#c.scrolling.bar = 'when-searching'
c.scrolling.bar = 'always'

## Enable smooth scrolling for web pages. Note smooth scrolling does not
## work with the `:scroll-px` command.
## Type: Bool
c.scrolling.smooth = True

## Scaling factor for favicons in the tab bar. The tab size is unchanged,
## so big favicons also require extra `tabs.padding`.
## Type: Float
c.tabs.favicons.scale = 1.5

## Padding (in pixels) for tab indicators.
## Type: Padding
c.tabs.indicator.padding = {'top': 10, 'bottom': 10, 'left': 5, 'right': 10}

## Width (in pixels) of the progress indicator (0 to disable).
## Type: Int
c.tabs.indicator.width = 10

## Position of new tabs opened from another tab.
## Type: NewTabPosition
## Valid values:
##   - prev: Before the current tab.
##   - next: After the current tab.
##   - first: At the beginning.
##   - last: At the end.
c.tabs.new_position.related = 'next'

## Position of new tabs which aren't opened from another tab.
## Type: NewTabPosition
## Valid values:
##   - prev: Before the current tab.
##   - next: After the current tab.
##   - first: At the beginning.
##   - last: At the end.
c.tabs.new_position.unrelated = 'last'

## Position of the tab bar.
## Type: Position
## Valid values:
##   - top
##   - bottom
##   - left
##   - right
c.tabs.position = 'bottom'

## Which tab to select when the focused tab is removed.
## Type: SelectOnRemove
## Valid values:
##   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
##   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
##   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'prev'


## Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
## for a blank page.
## Type: FuzzyUrl
c.url.default_page = 'file://' + home + '/.dotfiles/startpage/index.html'

## Search engines which can be used via the address bar. Maps a search
## engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
## placeholder. The placeholder will be replaced by the search term, use
## `{{` and `}}` for literal `{`/`}` signs. The search engine named
## `DEFAULT` is used when `url.auto_search` is turned on and something
## else than a URL was entered to be opened. Other search engines can be
## used by prepending the search engine name to the search term, e.g.
## `:open google qutebrowser`.
## Type: Dict
#c.url.searchengines = {'DEFAULT': 'https://search.privacytools.io/?q={}'}
c.url.searchengines = {'DEFAULT': 'http://localhost:8888?q={}'}
c.url.searchengines.update({'searx': 'https://searx.be?q={}'})
c.url.searchengines.update({'ddgo': 'https://3g2upl4pq6kufc4m.onion/?q={}'})
c.url.searchengines.update({'sp': 'https://www.startpage.com/do/search?query={}'})
c.url.searchengines.update({'yt': 'https://youtube.com/results?search_query={}'})
c.url.searchengines.update({'tw': 'https://twitter.com/{}'})
c.url.searchengines.update({'aw': 'https://wiki.archlinux.org/?search={}'})

## Page(s) to open at the start.
## Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ['file://' + home + '/.dotfiles/startpage/index.html']

## Available zoom levels.
## Type: List of Perc
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']


## Dark mode
## 
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.threshold.text = 150
c.colors.webpage.darkmode.threshold.background = 205
c.colors.webpage.preferred_color_scheme = 'dark'

## Default file picker
##
c.fileselect.handler = 'default'

## Bindings
config.bind('wi', 'devtools bottom')
config.bind('<Ctrl-0>', 'zoom 100')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
config.bind('e', 'set-cmd-text :open {url:pretty}')
config.bind('<Ctrl-p>', 'set-cmd-text -s :open -p ')
config.bind('<Ctrl-e>', 'open-editor', mode='insert')

## Youtube special bindings
config.bind('V', 'hint links spawn mpv {hint-url}')
config.bind('A', 'hint links spawn mpv {hint-url} --no-video')
config.bind(';V', 'spawn kitty youtube-dl --all-subs --output ~/temp/vid/yt/%(title)s.%(ext)s {url}')
config.bind(';A', 'spawn kitty youtube-dl --extract-audio --audio-format mp3 --output ~/temp/audio/yt/%(title)s.%(ext)s {url}')

## Open google translate with selection
config.bind('tR', 'spawn --userscript gtranslate-sel')
config.bind('tr', 'spawn --userscript gtranslate-url')
config.bind('pw', 'spawn --userscript password_fill')
config.bind('ard', 'spawn --userscript readability')
config.bind('tg', 'open -t libretranslate.com')
config.bind('sd', 'spawn --userscript open_download')

## Shortcuts
config.bind('tw', 'open -t https://twitter.com')
config.bind('td', 'open -t https://tweetdeck.twitter.com')
config.bind('yo', 'open -t https://youtube.com')
config.bind('h', 'open')

# Cycle stylesheets
config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets "~/.config/qutebrowser/css/nord-all-sites.css" "~/.config/qutebrowser/css/solarized.css" "" ')


# Expand in old reddit
config.set('hints.selectors', {'preview': ['.expando-button']},pattern='*://*.reddit.com/*')
config.bind(';p', 'hint preview')

# Clean mode
config.bind('cl', 'spawn --userscript readability-js')

#
# =============== Youtube ad blocking ================
#
from qutebrowser.api import interceptor

def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()

interceptor.register(filter_yt)
# ============== Done ad-blocking ===================

## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
config.load_autoconfig()

# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Brewer scheme by Timothée Poisot (http://github.com/tpoisot)

base00 = "#0c0d0e"
base01 = "#2e2f30"
base02 = "#515253"
base03 = "#737475"
base04 = "#959697"
base05 = "#b7b8b9"
base06 = "#dadbdc"
base07 = "#fcfdfe"
base08 = "#e31a1c"
base09 = "#e6550d"
base0A = "#f35888"
base0B = "#668cff"
base0C = "#668cff"
base0D = "#668cff"
base0E = "#756bb1"
base0F = "#b15928"
base10 = "#295499"
base11 = "#fafafa"
base12 = "#9740b7"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = base05

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = base01

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = base00

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = base0A

# Background color of the completion widget category headers.
c.colors.completion.category.bg = base00

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = base00

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = base00

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = base05

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = base02

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = base02

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = base02

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = base0B

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = base0B

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = base05

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = base00

if qutebrowser_version >= (1, 13, 0):
    # Background color of disabled items in the context menu.
    c.colors.contextmenu.disabled.bg = base01

    # Foreground color of disabled items in the context menu.
    c.colors.contextmenu.disabled.fg = base04

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = base00

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  base05

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = base02

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = base05

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = base08

# Font color for hints.
c.colors.hints.fg = base11

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = base0A

# Font color for the matched part of hints.
c.colors.hints.match.fg = base05

# Text color for the keyhint widget.
c.colors.keyhint.fg = base05

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = base05

# Background color of the keyhint widget.
c.colors.keyhint.bg = base00

# Foreground color of an error message.
c.colors.messages.error.fg = base00

# Background color of an error message.
c.colors.messages.error.bg = base08

# Border color of an error message.
c.colors.messages.error.border = base08

# Foreground color of a warning message.
c.colors.messages.warning.fg = base00

# Background color of a warning message.
c.colors.messages.warning.bg = base0E

# Border color of a warning message.
c.colors.messages.warning.border = base0E

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base00

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base02

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = base0B

# Background color of the statusbar.
c.colors.statusbar.normal.bg = base00

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = base00

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = base0D

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = base00

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0C

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = base00

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base12

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = base05

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = base05

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = base00

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0E

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = base00

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0D

# Background color of the progress bar.
c.colors.statusbar.progress.bg = base0D

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = base05

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = base08

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = base05

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = base0C

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = base0B

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = base0E

# Background color of the tab bar.
c.colors.tabs.bar.bg = base00

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = base0C

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = base05

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = base01

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = base05

# Background color of unselected even tabs.
c.colors.tabs.even.bg = base00

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = base0C

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = base07

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = base0B

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = base07

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = base10

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = base11

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = base10

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = base11

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = base11

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = base10

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = base11

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = base10

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = base00
