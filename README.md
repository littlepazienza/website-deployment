# Website Deployment
This is a configuration to run my webserver, jenkins, demos, and more. 

## Running
To start my services just clone this repo and `docker-compose up -d`

---
**NOTE**
Jenkins requires user information, so copy the users directory over from the old instance, or manually create a new user before starting the `jenkins` service.
---

## Jenkins
This contains the jenkins configuration files for my jobs. I am checking in as much information as I can excluding plugins, tools, etc. There may be some hashes on here containing my username so please don't hack me! Or do and tell me how I can prevent other smart chaps like you from doing me dirty like that. 

## Nginx
This contains my nginx web server configs which I have set up to redirect request to my [jenkins](https://jenkins.paz.ienza.tech) service, and also to host the files of my website which jenkins will occasionally modify. I don't have those files checked in but they will live in `var/www/html`.

## Var
This is the directory from which my nginx and jenkins services read / write. It will typically have my website files in there but for now I am checking in only some simple htmls to get started and once the [pazienza-tech master](https://jenkins.paz.ienza.tech/job/pazienza-tech/job/master/) job is run the website files will be deployed into the directory.

## Contribution
These are welcomed! I am not sure if I have this repository set up in a way where people can open pull requests, but if you notice any improvements to my setup they will certainly be welcomed.