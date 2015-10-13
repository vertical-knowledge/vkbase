{{ cookiecutter.project_name }}
==================

{{ cookiecutter.project_short_description }}

Congratulations! You are on your way to making an application using neat things like SaltStack and Docker!


You should probably replace this readme with something actually useful.

!!Important!!
-------------

This command will need to be run once before continuing:  
```
TODO
```


Instructions on how to start up your developer environment:  
```
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml shell
```


Your local dev directory is now mounted in the docker container, so any code changes you make locally will be reflected in the container.


Did you just need to run tests? Well, that's as easy as:  
```
docker-compose -f docker-compose.test.yml build
docker-compose -f docker-compose.test.yml test
```
