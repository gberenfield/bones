Bones
=====
<pre>
 .-.               .-.
(   `-._________.-'   )
 >=     _______     =
(   ,-'`       `'-,   )
 `-'               `-'
</pre>
Skeletal Rails App for Rails 3

There is an Attachment-Controller/Model/Views as an example of how to use everything in practice.

Just globally find+remove all "Attachment" files and references, or you may like having some ready-baked attachment handling!

- ruby-1.9.2-p180
- rails 3.0.7+ (gem)
- devise (gem)
- will_paginate (gem)
- formtastic (gem)
- paperclip (gem)
- blueprintr (gem)
- jQuery 1.6
- jquery-ui 1.8.12
- jqgrid 4
- colorbox 1.3.15


Cucumber Integration Tetsts
===========================

- in one terminal session type "spork cuc"
- in another terminal session type "cucumber"

RSpec Tests
===========

- in one terminal session type "spork"
- in another terminal session type "autotest"


Git / Github
============

  1. mkdir \<app_name\>
  2. cd \<app_name\>
  3. git init
  4. touch README.md
  5. git add README.md
  6. git commit -m 'first commit'
  7. git remote add origin git@github.com:\<username\>/\<app_name\>.git
  8. git push origin master


DATABASE
========

Database starts off with Sqlite3 db   (this is for development, iirc!)

  1. type "bundle" for gems
  2. rake db:setup (loads seed 'admin' account with password 'pass')

TODO
====

Turn this puppy into a templated meta-skeleton.