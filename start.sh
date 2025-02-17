#!/bin/bash
# npm install -g localtunnel
# unalias lt
if [ -d "./customdoge" ]; then
        echo "Custom Doge exists"
        cd customdoge
elif [ -f "localtunnel.js" ]; then
        echo "You're already in the current customdoge directory"
else
        git clone https://github.com/fakeperson12312/customdoge.git
        echo "Custom Doge downloaded"
        cd customdoge
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if command -v nvm &> /dev/null; then
        echo "nvm already installed"
        echo "node version: "
        node --version
else
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
        echo "this might take a couple seconds"
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
echo ""
# echo "Again, it's "
# curl ifconfig.me -4
npm start
