FROM node:latest

# This forces the Mesa3D graphics driver to choose software rendering instead of HW accelerated rendering.
ENV LIBGL_ALWAYS_SOFTWARE=1

RUN apt-get update && apt-get install curl gnupg -y \
  && curl --location --silent https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install google-chrome-stable -y --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN npm install puppeteer

COPY . /app

CMD ["node", "test.js"]
