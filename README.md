# Website Deployment
This is a configuration to run my webserver, demos, and more. 

## Website Files

The website files will not be packaged with this repository, it requires a setup action to clone the website into the correct directory. 

1. Install jq for unix
2. Ensure you have the github token installed: as $GITHUB_TOKEN in your env variables (See https://github.com/settings/tokens)
3. Run `upgrade-website.sh`

## Running
To start my services just clone this repo and `docker-compose up -d`

---

## Nginx
This contains my nginx web server configs which I have set up to redirect request to my [jenkins](https://jenkins.paz.ienza.tech) service, and also to host the files of my website which jenkins will occasionally modify. I don't have those files checked in but they will live in `var/www/html`.

## Var
This is the directory that nginx serves. It will typically have my website files in there but for now I am checking in only some simple htmls to get started and once the `upgrade-website.sh` script is run the files will be pulled into the correct places

## Contribution
These are welcomed! I am not sure if I have this repository set up in a way where people can open pull requests, but if you notice any improvements to my setup they will certainly be welcomed.