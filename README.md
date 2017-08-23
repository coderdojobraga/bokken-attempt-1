[build-page]: https://semaphoreci.com/coderdojobraga/bokken

# Bokken

[![Build Status](https://semaphoreci.com/api/v1/coderdojobraga/bokken/branches/master/badge.svg)](https://semaphoreci.com/coderdojobraga/bokken)
[![Trello](https://img.shields.io/badge/trello-board-blue.svg?style=flat-square)](https://trello.com/b/edBmziLg/cdm-webapp)
[![Staging](https://img.shields.io/badge/server-staging-orange.svg?style=flat-square)](https://bokken-staging.herokuapp.com)
[![Production](https://img.shields.io/badge/server-production-red.svg?style=flat-square)](https://bokken-production.herokuapp.com)

This is the app for ninja management and training within CoderDojo Minho.

We use it to track ninja progress, secret missions (homework) and belt ranks.

**Table of Contents**

* [Setup](#setup)
* [Development](#development)
* [Deployment](#deployment)

Setup
-----

First, clone & setup the repository:

```
git clone git@github.com:coderdojominho/bokken.git
cd bokken
bin/setup
```

Development
-----------

To start your development environment run:

```
bin/server
```

This will start the Rails app.

Deployment
----------

Deploys are run through [Semaphore][build-page]. They are deployed automatically
to staging when the build on master is green and manually to production.

You can also add `production` and `staging` remotes to deploy. We recommend using [`parity`](https://github.com/thoughtbot/parity) to manage it.

```shell
git remote add staging <heroku-staging-url>
git remote add production <heroku-production-url>

# deploying with parity:
staging deploy
production deploy

# deploying through git:
git push staging master
git push production master
```
