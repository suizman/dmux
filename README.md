# Docker Tmux environment

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/suizman/dmux?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](http://img.shields.io/travis/suizman/dmux.svg?style=flat-square)][travis]
[travis]: http://travis-ci.org/suizman/dmux

```WARNING: Work in progress! Still have several bugs to be fixed on non Arch Linux or Debian distros..```

KickAss Linux is a simple way to turn your favorite Linux distro into a powerful & beautiful workstation including all kind of goodies to improve Terminal or GUI but minimizing resource consumption too.

# Requirements

* Docker

## Basic Installation

#### Add this at the end of your ~/.bashrc|~/.zshrc
```alias dockermux="export DOCKER_HOST=localhost:2375 && docker run --rm -ti suizman/dmux tmux"```

or

```alias dockermux="sudo docker run --rm -ti suizman/dmux tmux"```
