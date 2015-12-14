# Blacklisted words for third party ads

## Development Setup

Setup local development on ruby 2.2

```
bundle
rake db:create db:migrate db:seed
```

In order to run the app

```
bin/rails server
```

## Add new black listed words

1. edit `db/blacklisted_words/type` file and add the new terms
2. run `rake db:reset db:setup` to update the mysql table

## Deploy

1. add heroku remote to your local git:  
   `heroku git:remote -a blacklisted-ad-words`
2. push your branch:
	* push master: `git push heroku master`
	* push dev branch: `git push heroku mybranch:master`
3. reset the database:  
   `heroku run rake db:reset db:setup`
   
   
## Multiple Apps

You can create your custom app as "staging" environment and add it as new remote to your git configuration file


```
; this is to execute commands onto a specific app:
heroku run rake db:reset db:setup --app=tb-blacklist

; show logs for a specific app
heroku logs -t --app=tb-blacklist 
```

