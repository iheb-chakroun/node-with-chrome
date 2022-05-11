FROM node:14.15.4

WORKDIR /home/app

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get -qq update && \
  apt-get install -qq -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/* && \
  export CHROME_BIN=/usr/bin/google-chrome

CMD google-chrome \
  --headless \
  --disable-gpu \
  --remote-debugging-port=9222 \
  --no-default-browser-check \
  --no-first-run \
  --disable-default-apps \
  --disable-popup-blocking \
  --disable-translate \
  --disable-background-timer-throttling \
  --disable-renderer-backgrounding \
  --disable-device-discovery-notifications