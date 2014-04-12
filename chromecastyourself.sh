#!/bin/bash

if [ -d ~/Desktop/chromecastyourselfapp/chromecastyourself ]; then
    cd ~/Desktop/chromecastyourselfapp/chromecastyourself
    echo "Application already installed, let's update and run it ! :)"
    git pull --rebase
    echo "#### Step 1/1 : Done"
    echo "Installing dependencies..."
    gem install bundler
    bundle
else
    echo "-----------------------------------"
    echo "- Welcome on Chromecastyourself ! -"
    echo "-     Created by Rémi Delhaye     -"
    echo "-----------------------------------"
    echo "Wait while the application is downloading..."
    cd ~/Desktop
    mkdir chromecastyourselfapp
    cd chromecastyourselfapp
    echo "#### Step 1/2 : Done"
    git clone https://github.com/chromecastyourself/chromecastyourself.git
    echo "#### Step 2/2 : Done"
    cd chromecastyourself;
    echo "Installing dependencies..."
    gem install bundler
    bundle
    echo "Setup database..."
    rake db:drop
    rake db:create
    rake db:migrate
fi

echo "---------------------------------------------------"
echo "- Everything looks ok ! Enjoy your streaming ! :D -"
echo "---------------------------------------------------"
unicorn
