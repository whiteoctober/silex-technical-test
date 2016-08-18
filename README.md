White October Technical Test
===============================

This is a simple [Silex](http://silex.sensiolabs.org/) app. We would like you to extend and fix it.
## Setup

You can optionally use Vagrant or your own PHP environment to set up this project.

#### Setup with Vagrant

This project is setup with [Vagrant](http://vagrantup.com). See the [instructions on how to install vagrant](https://www.vagrantup.com/docs/installation/) to get started.

Once you have it installed in the project root run "vagrant up". This will provision your box, install [Composer](http://getcomposer.org) and then install your vendors.

#### Your own PHP environment requirements

You need to be running PHP5.3.3>, a webserver (Apache/Nginx) and the PHP extension sqlite. You should point your webserver to the `/public` directory in this project.

#### Install composer vendors

[Composer](http://getcomposer.org) is used to install Silex and the required vendors.

Install [Composer](http://getcomposer.org):

	curl -s http://getcomposer.org/installer | php

Install the vendors:

	php composer.phar install

#### Setup the SQLite data

We have created a very hacky way of getting data into the app. In the project you will find a route called "setup". So the first thing you need to do is visit this route in your browser.

	http://192.168.33.10//setup

This should respond with a "done"

You should be able to visit http://192.168.33.10//1 to view article 1.

The Tasks
------
* Create a new route matching "/", the home route.
	* Load in the latest 10 articles in the database
	* Display them in a list to the user displaying title and short description.
	* Give the user a link to click to view the full article.
* Modify the article view route to display the article, rather than the simple test that is currently there.
* Install Twig Via Composer as per these [instructions](http://silex.sensiolabs.org/doc/providers/twig.html)
* Rather than responding inline with some html, use [Twig](http://twig.sensiolabs.org/) templates for the home and article routes.
* Use [twitter bootstrap](http://twitter.github.com/bootstrap/) for your templates

Extras..
------
If you'd like to go the extra mile then maybe do some of the following

* Add tests
	* [PHPUnit](http://www.phpunit.de/manual/current/en/index.html)?
	* [Behat](http://behat.org/)?
* Come up with a better solution to the setup route for setting up.
* Add paging with [Pagerfanta](https://github.com/whiteoctober/Pagerfanta)
* The database structure is a bit basic, add some more fields suitable for a news site
* Doctrine ORM to manage articles, installed with composer?
	* https://github.com/mjakubowski/nutwerk-orm-extension
	* http://martinsikora.com/silex-doctrine2-orm
* Anything else you'd like to show us or fix
