Description
===========

To date, this cookbook has only been designed and tested on the
Ubuntu and Debian platforms.

Requirements
============

The carton cookbook depends on 'perlbrew' and an older version of the 'runit' cookbook.

The 'perlbrew' cookbook is available from the
[Opscode Community site](http://community.opscode.com/cookbooks/perlbrew) or from
the [perl-chef](http://github.com/dagolden/perl-chef) git repository.

The 1.6.0 version of 'runit' is pinned due to [runit#142](https://github.com/hw-cookbooks/runit/issues/142).

Attributes
==========

* `node['carton']['perlbrew'] = 'perl-5.14.2'` - Sets default perl for carton apps if not specified by user

Recipes
=======

carton
----------

Loads the 'perlbrew' and 'runit' recipes to ensure those LWRPs are ready for use.  This *must* be loaded
before using the 'carton_app' LWRP.

Resources/Providers
===================

carton_app
-------------

This LWRP sets up a [carton](https://metacpan.org/module/carton) application as
a runit service and passes through runit commands to start/stop or otherwise
control the service.

Example:

    carton_app "hello-world" do
      perlbrew node['hello-world']['perl_version']
      command "starman -p #{node['hello-world']['port']} app.psgi"
      cwd node['hello-world']['deploy_dir']
      user node['hello-world']['user']
      group node['hello-world']['group']
    end

    carton_app "hello-world" do
      action :start
    end

This installs all dependencies of a carton app in a deployment directory using
a particular perl, sets up a runit service using the given command, and
starts the service.

Actions:

* :enable - ensure carton dependencies are installed and set up the runit service (default action)
* :disable - disables the runit service
* :start - start the service
* :stop - stop the service
* :restart - restart the service

Attributes:

* :perlbrew - name of a perlbrew perl to use to run the application. This
will be installed using the perlbrew LWRP if not already availble
* :command - shell command to launch the application.  This must launch the
application in the foreground; runit will ensure it is properly daemonized
* :cwd - directory containing the application.  The service will also be
launched in this directory (via "carton exec -I lib -- $command").
* :user - user under which the service will run
* :group - group under which the service will run
* :environment - a hash of environment variables that will be set prior
to running the service

Usage
=====

If you wish to use the LWRP, be sure to include the `carton` recipe, which
ensures that carton is ready for use.
