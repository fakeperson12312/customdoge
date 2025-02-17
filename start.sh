#!/bin/bash
npm install -g localtunnel
unalias lt
if [ -d "./customdoge" ] || [ -f "./localtunnel.js" ]; then
        echo "Custom Doge exists"
else
        git clone https://github.com/fakeperson12312/customdoge.git
        echo "Custom Doge downloaded"
        cd customdoge
fi
if command -v nvm &> /dev/null; then
        echo "nvm already installed"
        echo "node version: "
        node --version
else
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
        source ~/.bashrc
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        nvm install 22
        nvm use 22
fi
npm i
echo "IP ADDRESS, SAME AS PASSWORD: "
curl https://loca.lt/mytunnelpassword
npm start
