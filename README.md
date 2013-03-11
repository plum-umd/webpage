# [PLUM][plum-url] website config
author: Kris Micinski and Stevie Strickland 

To generate the site just run the following commands:

    $ bundle install      # To get gem dependencies
    $ rake install        # To build index.html and then install it.

To deploy the site, you can use the `deploy` rake target:

    rake deploy[username] # e.g., rake deploy[sstrickl]

This assumes you have the 'bundler' and 'rake' gems installed.

The configuration (in the `conf/` directory) is based on two files:

 - `people.json` -- To describe people
 - `projects.json` -- To describe current projects

`people.json` is used to configure and set up group members.  If you
need to edit or add positions of group members, please use this file.

`projects.json` is used to generate the list of projects.
Eventually I intend to expand it to have have drop down descriptions
of the top projects along with associated papers.

The code that actually parses and generates these tools relies on the
`liquid` gem (the same thing used by Jekyll, but we don't really need
preprocessing), along with JSON.

[plum-url]: http://www.cs.umd.edu/projects/PL/ "PLUM @ UMD"
