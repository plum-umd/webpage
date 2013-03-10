# PLUM website config
author: Kris Micinski

To generate the site just use

    ./generate_website.sh

The configuration is based on two files:

 - people.json -- To describe people
 - projects.json -- To describe current projects

`people.json` is used to configure and set up group members.  If you
need to edit or add positions of group members, please use this file.

`projects.json` is used to generate the list of current projects.
Eventually I intend to expand it to have have drop down descriptions
of the top projects along with associated papers.  It only holds the
"current projects," I haven't taken the time to migrate others.

The code that actually parses and generates these tools relies on the
`liquid` gem (the same thing used by Jekyll, but we don't really need
preprocessing), along with JSON.

