#!/bin/bash

pen_test="https://space.bilibili.com/491748397/channel/collectiondetail?sid=821390"
linux="https://space.bilibili.com/491748397/channel/collectiondetail?sid=1343156"
# red_team_tools="https://space.bilibili.com/491748397/channel/seriesdetail?sid=2663754"

echo "Please enter the collection you want to install:"
echo "Options:
        all -- Download all collections
        pen -- Download only Penetration Testing collection
        linux -- Download only Linux collection"
read -r collection_name

function download_all {
	yt-dlp --playlist-reverse -ciw -o "./Penetration Testing/%(playlist_index)s - %(title)s.%(ext)s" "$pen_test" --cookies-from-browser chrome
	yt-dlp --playlist-reverse -ciw -o "./Linux/%(playlist_index)s - %(title)s.%(ext)s" "$linux" --cookies-from-browser chrome
	# yt-dlp --playlist-reverse -ciw -o "./Red Team Tools/%(playlist_index)s - %(title)s.%(ext)s" "$red_team_tools" --cookies-from-browser chrome
}

if [ "$collection_name" == "all" ]; then
	download_all
elif [ "$collection_name" == "pen" ]; then
	yt-dlp --playlist-reverse -ciw -o "./Penetration Testing/%(playlist_index)s - %(title)s.%(ext)s" "$pen_test" --cookies-from-browser chrome
elif [ "$collection_name" == "linux" ]; then
	yt-dlp --playlist-reverse -ciw -o "./Linux/%(playlist_index)s - %(title)s.%(ext)s" "$linux" --cookies-from-browser chrome
# elif [ "$collection_name" == "tools" ]; then
# 	yt-dlp --playlist-reverse -ciw -o "./Red Team Tools/%(playlist_index)s - %(title)s.%(ext)s" "$red_team_tools" --cookies-from-browser chrome
fi
