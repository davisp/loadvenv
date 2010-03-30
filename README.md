loadvenv
========

A small script for loading virtualenv shells.

Installation
------------

    $ git clone git://github.com/davisp/loadvenv.git
    $ cd loadvenv
    $ cp loadvenv /some/where/on/your/path

Configuration
-------------

You can confiugre loadvenv by creating a ~/.loadvenv.rc file that can set a
couple parameters:

* ``ENV_ROOT`` - The base directory that contains your virtual environments
* ``PRE_LOAD`` - Script to execute beore activating the virtualenv
* ``POST_LOAD`` - Script to run after activating the virtualenv

Running
-------

    $ loadvenv name_of_env

License
-------

Released under the Tumbolia Public License. See the LICENSE file for more
details.
