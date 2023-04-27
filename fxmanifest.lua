fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'UI Was Re-Written by vipex#2027'
version "1"

ui_page "nui/ui.html"

escrow_ignore {
    'changestats.lua',
}
files {
    "nui/ui.html",
    "nui/ui.js",
    "nui/ui.css",
    "nui/material-icons.ttf",
    "nui/material-icons.css",
    "nui/loadscreen.jpg",
    "nui/fancy-crap.css",
    "nui/fancy-crap.js",
    "nui/jquery.min/js",
    "nui/html/news.html",
    "nui/html/laws.html",
    "nui/html/hotties.html",
    "nui/html/youtube.html",
    "nui/html/spotify.html",
    "nui/html/snake.html",
    "nui/html/car/car.html",
    "nui/html/car/carjs.js",
    "nui/html/car/carcss.css",
    "nui/html/fuckyouitsdope.png",
    "nui/html/jobsfordummies.html",
    "nui/html/rulesforassholes.html",
    "nui/bootstrap.min.css",
    "nui/html/opencad.html"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}

client_scripts {
    "client.lua",
    "nui/html/car/util.lua",
}