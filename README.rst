Python-PlexLibrary
==================

Python command line utility for creating and maintaining dynamic Plex
libraries based on "recipes".

E.g. Create a library consisting of all movies or tv shows in a Trakt_ list or
on an IMDb_ chart that exist in your main library, and set the sort titles
accordingly.

.. _Trakt: https://trakt.tv/
.. _IMDb: https://imdb.com/

Disclaimer
----------
This is still a work in progress, so major changes may occur in new versions.

Requirements
------------

* Python 3

* You need a trakt.tv account and an API app: https://trakt.tv/oauth/applications/new

* (optional) The Movie Database API

  * https://developers.themoviedb.org/3/getting-started
    
  * Required for fetching scores, release dates etcetera, for weighted sorting 
    
  * Required for matching any library items that use the TMDb agent with the items from the lists (if those items do not include a TMDb ID)
    
  * Shouldn't be necessary for Trakt, as those usually all have TMDb IDs.

  * Required for matching movies and some TV shows sourced from IMDb

* (optional) TheTVDB API

  * https://www.thetvdb.com/?tab=apiregister
    
  * Required for matching any library items that use the TheTVDB agent with the items from the lists (if those items do not include a TheTVDB ID)
    
  * Shouldn't be necessary for Trakt, as those usually all have TVDB IDs.

  * Required for matching TV shows sourced from IMDb

Getting started
---------------

1. Clone or download this repo.

   .. code-block:: shell

       sudo apt-get install git
       sudo mkdir -p /opt/appdata
       cd /opt/appdata 
       sudo git clone https://github.com/doob187/python-plexlibrary.git
       cd python-plexlibrary 

   .. code-block:: shell

       sudo apt-get install git 
       sudo git clone https://github.com/doob187/python-plexlibrary.git /opt/appdata/python-plexlibrary
       cd /opt/appdata/python-plexlibrary 

2. Install Python3 and pip if you haven't already.

3. Install the requirements:

   .. code-block:: shell

       pip install -r requirements.txt

4. Copy config-template.yml to config.yml and edit it with your information.

   .. code-block:: shell

       cp -rv config-template.yml config.yml 


  * Here's a guide if you're unfamiliar with YAML syntax. **Most notably you need to use spaces instead of tabs!** http://docs.ansible.com/ansible/latest/YAMLSyntax.html

5. Check out the recipe examples under recipes/examples. Copy an example to recipes/ and edit it with the appropriate information.

6. recipes edits USERSIDE !!

   .. code-block:: shell

       nano recipes/ > press tag to see all recipes.yml 
       For Movies
       adjust 1.1) 'name' = Plex library name. ->  - name: 'Filme'
       For TV Shows
       adjust 1.2) 'name' = Plex library name. ->  - name: 'Serien'
       adjust 2.1) Example path below assumes main movies are located ->    - '/mnt/unionfs/Movies'
       adjust 2.2) Example path below assumes main movies are located ->    - '/mnt/unionfs/tv'
       adjust 3.) 'folder' = Path on host where symlinks are stored ->  folder: '/mnt/recipes/movies/action/'
       CTRG + O + Y
       done :-)

7. The plexlibrary.sh inside the script folder 

   .. code-block:: shell

       if you dont used /opt/appdata edit follow line 
       nano scripts/plexlibrary.sh
       ( 
         adjuts -> FOLDER="/opt/appdata" 
         adjust -> CRONTIME="daily"
       )
       CTRG + O + Y 
       done ;-)
    
---------------

Usage
-----
In the base directory, run:

.. code-block:: shell

    python3 plexlibrary -h

for details on how to use the utility.

.. code-block:: shell

    python3 plexlibrary -l

lists available recipes.

To run a recipe named "movies_trending", run:

.. code-block:: shell

    python3 plexlibrary movies_trending
    
**(If you're on Windows, you might have to run as admin)**

When you're happy with the results, automate the recipe in cron_ or equivalent (automated tasks in Windows https://technet.microsoft.com/en-us/library/cc748993(v=ws.11).aspx).

.. _cron: https://code.tutsplus.com/tutorials/scheduling-tasks-with-cron-jobs--net-8800

**Pro tip!**

Edit the new library and uncheck *"Include in dashboard"*. 
Othewise if you start watching something that exists in multiple libraries, all items will show up on the On Deck. 
This makes it so that only the item in your main library shows up.

**Pro tip2**
for language edits used follow file ;-)
for German User or all other ^^

.. code-block:: shell

    nano plexlibrary/plexutils.py
            
change follow line ONLY !!!

from 

.. code-block:: shell

    'language': 'en',
    to
    'language': 'any_language_what_you_want',

.. code-block:: shell

    CTRG + X - Y !

.. code-block:: shell

    python3 plexlibrary movies_trending

Now all new libarys will automatic used the fixed language ;)



Planned features
----------------
See issues.

Credit
------
Original functionality is based on https://gist.github.com/JonnyWong16/b1aa2c0f604ed92b9b3afaa6db18e5fd

