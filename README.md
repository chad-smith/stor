# stor

stor is a simple application for creating and managing lists of arbitrary information. Lists can be related to each other and can have application-like actions composed upon them.

stor is a rails 3.x / ruby 1.9.x app. Data is currently stored in mongo. It expected to always be most suitable to use an Object DB due to the dynamic nature of the data.

# Getting set up

Development so far on stor has taken place on ubuntu, the instructions given below are related to that environment.

### Install ruby and rails
I recommend RVM which is now quite painless and for which there are some good youtube videos.

### Install mongo
```
sudo apt-get install mongodb
```

If all is successful you should be able to run 'mongo' at the command line which will open an interactive prompt. 
Typing 'show dbs' should return a single entry, "local (empty)". Type exit to leave the prompt.

### Get the source

How you go about getting the source is up to you, if you want to contribute back and have a github account clone it into your personal respository and send me a pull request. If you just want to run up the app use:

```
git clone git://github.com/chad-smith/stor.git
```
A directory will be created called stor at the location of the prompt.

### Install Gems

```
cd stor
bundle install
```
### Run it
Start the rails server using:

```
rails s
```

Then open a browser at http://localhost:3000/lists