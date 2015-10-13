# vkbase
A <a href="https://github.com/audreyr/cookiecutter">cookiecutter</a> template for a basic project layout (language agnostic).

To use, simply run:  
```shell
cookiecutter https://github.com/vertical-knowledge/vkbase
```


The idea is to have your application provisioned/installed/configured with a <a href="https://docs.saltstack.com/en/latest/">SaltStack</a> `salt-minion` inside of a <a href="https://www.docker.com/whatisdocker">Docker</a> container. 

There are two ways to run your application:  
  - for tests (useful for CI tools such as <a href="https://jenkins-ci.org/">Jenkins</a>)
  - for development (docker-compose allows an easy set up of microservices)
