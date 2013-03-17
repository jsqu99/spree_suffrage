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

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 [name of extension creator], released under the New BSD License
