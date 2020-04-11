# Auction House

### Installation steps

#### Installing MySQL

```bash
sudo apt install mysql-server
sudo mysql_secure_installation
```

#### Installing Ruby on Rails using rvm (ruby version manager)

First, install curl and gnupg

```bash
sudo apt install curl
sudo apt install gnupg2
```

Now, run these commands to install rvm

```bash
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -  
curl -sSL https://get.rvm.io | bash -s stable
```

Important : For RVM to work properly, you have to check the 'Run command as login shell' checkbox on the Title and Command tab of the terminal's Edit ▸ Profile Preferences menu dialog, in case the menu is missing right-click the terminal app and navigate Profiles ▸ Profile Preferences.


#### Installing rails 5.2.2 with ruby 2.6.1

```bash
rvm install 2.6.1
rvm use 2.6.1 --default
gem install bundler
gem install rails -v 5.2.2
```

#### Others

Install mysql gem and the libmysql-dev library

```bash
sudo apt install libmysqld-dev
gem install mysql2
```

Note: For some of the js gems

```bash
sudo apt install nodejs
```

### How to run the project

Run the following code in your terminal to download the project.

```bash
https://github.com/YashasG98/Auction_House.git
cd Auction_House/
```

Change the password (replace 'Game_server') at line 17 of config/database.yml to your local MySQL password. Run the following command inside the home folder and open http://localhost:3000/.

```bash
bundle install
rails db:create
rails db:migrate
rails server
```

### List of all implemented features

* User signup, login, logout
* User can add products to allow bidding
* Shop from where user can bid for objects
* User can check products sold by him and see which products have been claimed by whom
* User can check products waiting to be claimed and also products claimed by him
* Appropriate error and success alerts have been added everywhere

### List of non-implemented/planned features

* Wallet Crediting feature
* User profile page
