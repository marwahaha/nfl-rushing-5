# theScore "the Rush" Interview Question
At theScore, we are always looking for intelligent, resourceful, full-stack developers to join our growing team. To help us evaluate new talent, we have created this take-home interview question. This question should take you no more than a few hours.

**All candidates must complete this before the possibility of an in-person interview. During the in-person interview, your submitted project will be used as the base for further extensions.**

### Why a take-home interview?
In-person coding interviews can be stressful and can hide some people's full potential. A take-home gives you a chance work in a less stressful environment and showcase your talent.

We want you to be at your best and most comfortable.

### A bit about our tech stack
As outlined in our job description, you will come across technologies which include a server-side web framework (either Ruby on Rails or a modern Javascript framework) and a front-end Javascript framework (like ReactJS)

### Understanding the problem
In this repo is the file [`rushing.json`](/rushing.json). It contains data about NFL players' rushing statistics. Each entry contains the following information
* `Player` (Player's name)
* `Team` (Player's team abbreviation)
* `Pos` (Player's postion)
* `Att/G` (Rushing Attempts Per Game Average)
* `Att` (Rushing Attempts)
* `Yrds` (Total Rushing Yards)
* `Avg` (Rushing Average Yards Per Attempt)
* `Yds/G` (Rushing Yards Per Game)
* `TD` (Total Rushing Touchdowns)
* `Lng` (Longest Rush -- a `T` represents a touchdown occurred)
* `1st` (Rushing First Downs)
* `1st%` (Rushing First Down Percentage)
* `20+` (Rushing 20+ Yards Each)
* `40+` (Rushing 40+ Yards Each)
* `FUM` (Rushing Fumbles)

##### Requirements
1. Create a web app. This must be able to do the following steps
    1. Create a webpage which displays a table with the contents of `rushing.json`
    2. The user should be able to sort the players by _Total Rushing Yards_, _Longest Rush_ and _Total Rushing Touchdowns_
    3. The user should be able to filter by the player's name
    4. The user should be able to download the sorted/filtered data as a CSV

2. Update the section `Installation and running this solution` in the README file explaining how to run your code

### Submitting a solution
1. Download this repo
2. Complete the problem outlined in the `Requirements` section
3. In your personal public GitHub repo, create a new public repo with this implementation
4. Provide this link to your contact at theScore

We will evaluate you on your ability to solve the problem defined in the requirements section as well as your choice of frameworks, and general coding style.

### Help
If you have any questions regarding requirements, do not hesitate to email your contact at theScore for clarification.

### Installation and running this solution

To install Elixir, Phoenix, and Yarn using Brew follow the steps below:
  * Update Brew `brew update`
  * Install elixir `brew install elixir`
  * Install elixir package manager `mix local.hex`
  * Install Phoenix `mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez`
  * Install Yarn `brew install yarn`

Next, We need Postgresql Installed
  * Install the Postgres application from [`postgresapp`](https://postgresapp.com/downloads.html)
  * Open Postrgres application, initialize and start postgres if not already running


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create, Migrate, and Seed your database with `mix ecto.setup`
  * Install dependencies with `cd assets && yarn install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
