SpreeSuffrage
=============

[![Build Status](https://travis-ci.org/jsqu99/spree_suffrage.png)](https://travis-ci.org/jsqu99/spree_suffrage)

Suffrage = the right of voting

This is a spree extension that provides polling/voting capability

Currently spree 2.0.0.beta (bleeding edge spree/master) is supported.


Installation
==============

    gem 'spree_suffrage', github: 'jsqu99/spree_suffrage'
    bundle exec rails g spree_suffrage:install

Usage
------

After creating a poll in the admin app, you'll want to determine how/where you want to include the [poll partial](https://github.com/jsqu99/spree_suffrage/blob/master/app/views/spree/polls/_poll.html.erb)


This is an example I use in the specs to insert the partial:

    Deface::Override.new(name: 'add_poll_to_home_page', 
                         virtual_path: 'spree/shared/_sidebar', 
                         insert_top: '#sidebar[data-hook],[data-hook=sidebar]', 
                         partial: 'spree/polls/poll')

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 Jeff Squires, released under the New BSD License
