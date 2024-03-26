#!/bin/bash

flatpaks=(
  "com.mattermost.Desktop"
  "com.spotify.Client"
  "com.ulduzsoft.Birdtray"
  "org.mozilla.Thunderbird"
  "org.signal.Signal"
)

flatpak install -y "${flatpaks[@]}"
