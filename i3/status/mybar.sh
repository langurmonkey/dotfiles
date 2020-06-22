echo '{ "version": 1, "click_events":true }'
echo '['
echo '[]'

# launched in a background process
(while :;
do
  echo ",[{\"name\":\"id_time\",\"full_text\":\"$(date)\"}]"
  sleep 1
done) &

# Listening for STDIN events
while read line;
do
  # echo $line > /tmp/tmp.txt
  # on click, we get from STDIN :
  # {"name":"id_time","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # DATE click
  if [[ $line == *"name"*"id_time"* ]]; then
    termite -e $HOME/.dotfiles/i3/status/click_time.sh &
  fi  
done
