Overview
--------

This package provides a automatic login mechanism for the Internet provider [highspeedsurfer.de](http://www.highspeedsurfer.de) for the student dormitories ran by the [AKAFÖ](http://www.akafoe.de/wohnen/wohnheime/) at [Ruhr Universität Bochum](http://www.ruhr-uni-bochum.de) in Germany.


How does it work
----------------

The connection is checked every 15 minutes and a login is processed if needed.


Install
-------

Create a file ``modules`` with the following content in your ``site`` directory:


``GLUON_SITE_FEEDS="rublogin"``

``PACKAGES_SSIDCHANGER_REPO=https://github.com/muebau/rub-login.git``

``PACKAGES_RUBLOGIN_COMMIT=3ccd3716fb5c4eb6dcd5d86a21bb57c15954070b``

With this done you can add the package `gluon-luci-rub-login` to your `site.mk`.


Thanks
-------

Thanks to Simon Christmann for the permission to use the original [script](https://github.com/dersimn/rub-login).
