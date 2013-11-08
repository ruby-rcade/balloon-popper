This repository contains an example game, written in Ruby, using [Gosu](http://www.libgosu.org).

This game has been tested to run on Ruby 2.0.0-p247. If you're using a different version of Ruby, 
you may run into bugs.

### Getting Started:

    git clone https://github.com/ruby-rcade/balloon-popper
    cd balloon-popper
    bundle install
    ruby game.rb

In addition to Gosu, this game uses a gem that I created called `rcade_controls` which is designed for 
programming games that run on an arcade machine. If you're running this game on a desktop, you may have 
trouble trying to figure out which keys to use. Here are the keyboard keys to control each player:

> **Player 1:** Control + Spacebar
> **Player 2:** A + Q
