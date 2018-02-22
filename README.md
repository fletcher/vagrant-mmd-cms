

## Prerequisits ##

You will need to install:

*	[Vagrant](https://www.vagrantup.com/)

*	[VirtualBox](https://www.virtualbox.org/)


## Build the Virtual Server ##

First, we want to create the virtual machine using Vagrant.  From within the
vagrant-mmd-cms directory:

	vagrant up

After a minute or two the setup should complete.  You can then use your normal
browser to check and see if the site is available -- <http://127.0.0.1:8080>.

You should see an empty "Index of /" page.


## Install MultiMarkdown-CMS ##

Next, we want to create an empty
[MMD-CMS](https://github.com/fletcher/MultiMarkdown-CMS) site:

	./create_mmd_cms_site.sh

This script downloads the latest MMD-CMS framework and configures a new site
inside the `www` directory.

If you refresh your browser, you should now see (a rather boring) new web site.


## Add Content ##

To add content, you create a text file ending in (`.txt`) in the desired
location.  The `new_page.sh` script can generate one for you and put it in the
proper location for the current date and time.  (You don't have to organize
your pages by date though).

The content files should contain metadata for the title, date, and tags (if any).


## Build Content ##

Once you have written your content, MMD-CMS will process it for you to create
the required HTML pages.  Simply run `make` inside the `www` directory.

You can now check your browser, refresh, and see the new content.


## Customize Appearance ##

MMD-CMS provides a very flexible, lightweight framework for a site.  But you
probably want to make it look a little better.  You can use custom CSS to set
your desired appearance.  You can even use a framework such as
[Bootstrap](https://getbootstrap.com/) to help you out.  (Using and
configuring Boostrap is beyond the scope of this document.)


## Multiple Servers ##

With this setup, it's quite simple to have more than one server.  Simply
create separate copies of the vagrant-mmd-cms directory, and put the
appropriate content in the respective www directories.

If you want to run only one server at a time, simply start (`vagrant up`) and
stop (`vagrant halt`) each server when you're done.

If you want to run more than one machine at a time, you'll need to assign different
ports on the host for each server in the Vagrantfile:

	config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

