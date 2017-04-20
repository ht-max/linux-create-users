# Create Users script

## Script creates user.

```bash
   sh /path_to_script/create_user.sh USER PASSWORD MYSQLPASSWORD
```
Script has takes three parameters:
1) **USER** - login name of new user. It's for FTP, SSH, MySQL user nmae
2) **PASSWORD** - password of new user 
3) **MYSQLPASSWORD** - password of new user for mysql database

### Feature
* Auto create database pattern. Each use has access to his own tables with user name prefix. (e.g. UserName: jack; It means he can create databases like a pattern: "jack_firstdb", "jack_seconddb", "jack_somethingelse")
* Auto create new VirtualHost with patter **/home/USER/PROJECT/public_html/index.html**. So you have awesome URL of sub-domains: http://USER.PROJECT.website.com/
* Auto reload Apache2
* Comfortable URL http://user.project.website.com/
* Apache logs (Access log & Error log) writes into your home directory. So you able to read it and resolve errors. 

## Script create single user

The script works same as above. The one different - user has only one sub-domain. It's his own name. For example, username: james. It means your url will be http://user.website.com/