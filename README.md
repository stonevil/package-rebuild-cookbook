[![Build Status](https://secure.travis-ci.org/stonevil/package-rebuild-cookbook.png?branch=master)](https://travis-ci.org/stonevil/package-rebuild-cookbook)

Description
===========

Template cookbook for rebuild Debian/Ubuntu and RedHat/CentOS packages.

Requirements
============

* Ubuntu Ubuntu 12.04
* Debian 6
* RHEL 6 and derivatives (CentOS, Amazon Linux, Oracle Linux, Scientific Linux)
* Fedora

Attributes
==========

* `['package']['folder_path']` - build folder (defaults to /build)
* `['package']['folder_owner']` - build folder owner (defaults to root)
* `['package']['folder_group']`- build folder group (default to root)
* `['package']['folder_pkg']` - folder for share packages (defaults to /pkg)

Debian attributes
-----------------

* `['package']['uri']` - packages server URI (no defaults)
* `['package']['keyserver']` - key server (no defaults)
* `['package']['key']` - package server key (no defaults)
* `['package']['name']` - package to repack ( defaults to grep)
* `['package']['version']` - package version (defaults to  2.10)
* `['package']['purge']` - purge packages from system before rebuild (defaults to false)

RedHat attributes
-----------------

TODO

Usage
=====

TODO

Recipes
=======

TODO

TODO
====

* Add RedHat platform family support
* Finish documentation
* Implement 

License and Author
==================

Author:: Myroslav Rys <stonevil@gmail.com>

Copyright:: 2013

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
