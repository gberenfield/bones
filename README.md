My Skeletal Rails App for Rails 3

	I have created an "AttachmentController/Model/Views" as an example		
	of  how to  use everything  in  practice (basic  CRUD stuff). Just		
	globally find+remove  all "Attachment" files and references, or you		
	may like having some ready-baked attachment handling!

- ruby-1.9.2-p180
- rails 3.0.7+ (gem)
- devise (gem)
- will_paginate (gem)
- formtastic (gem)
- paperclip (gem)
- blueprintr (gem)
- jQuery 1.5.2
- jquery-ui 1.8.12
- jqgrid 4
- colorbox 1.3.15


TESTING
=======

- in 1 terminal session type "spork cuc"
- in another terminal session type "autotest" for specs or "cucumber" for cucumber specs


GIT / GitHUB
============

  mkdir <app_name>
  cd <app_name>
	*  rm -r .git (this is to remove bones's git info for github - ok, for me, only ;)
  git init
  touch README
  git add README
  git commit -m 'first commit'
  git remote add origin git@github.com:<username>/<app_name>.git
  git push origin master


DATABASE
========

Database starts off with Sqlite3 db   (this is for development, iirc!)

  1. type "bundle" for gems
  2. rake db:setup (loads seed 'admin' account with password 'pass')

