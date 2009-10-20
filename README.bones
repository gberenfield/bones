My Skeletal Rails App for Rails 2.3.4

* authlogic (gem)
* jQuery + jqgrid + jrails + lwrte (all manually installed/maintained)
* blueprint css (plugin)
* mislev will_paginate (gem)
* nifty_scaffold (gem)         # do I really need/benefit from this?
* formtastic (gem) # with one necessary override for lwrte!
* paperclip (gem)

Database starts off with Sqlite3 db   (this is for development, iirc!)

1. sudo rake gems:install # to install any missing gems used above!
2. rake db:migrate
2. rake db:seed (loads seed 'admin' account)


******************************************************************************
**																																					**
**		I have created an "AttachmentController/Model/Views" as an example		**
**		of  how to  use everything  in  practice (basic  CRUD stuff). Just		**
**		globally find+remove  all "Attachment" files and references, or you		**
**		may like having some ready-baked attachment handling!									**
**																																					**
******************************************************************************


GIT / GitHUB
============

mkdir <app_name>
cd <app_name>
	*  rm -r .git (this is to remove bones's git info for github - ok, for me, only ;)
git init
touch README
git add README
git commit -m 'first commit'
git remote add origin git@github.com:gberenfield/<app_name>.git
git push origin master
      


DEPLOYMENT
==========
1. need to edit /etc/mongrel_cluster/<app_name>.conf on your deployment location
2. cap deploy:setup
3. cap deploy
4. will need to edit/copy/create <app_name>/shared/config/database.yml file on 
   your deployment location
5. cap deploy:migrate
