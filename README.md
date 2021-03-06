# Shopify Rails React

<div align="center">
  Amazing test project for consuming Shopify API, building Rails API and consuming from a React App. 
</div>

---

<details open="open">
<summary>Table of Contents</summary>

- [Backend with Rails API](#backend-with-rails-api)
  - [Backend Requeriments](#backend-requeriments)
  - [Backend Installation](#backend-installation)
  - [Backend Database](#backend-database)
  - [Backend Server](#backend-server)
  - [Backend Tests](#backend-tests)
- [Frontend with React App](#frontend-with-react-app)
  - [Frontend Requeriments](#frontend-requeriments)
  - [Frontend Installation](#frontend-installation)
  - [Frontend Server](#frontend-server)

</details>

---

# Backend with Rails API

## Backend Requeriments
- Ruby 3.0.1
- Rails 6.0.4
- To have [ngrok](https://ngrok.com) installed

## Backend Installation
- Open Rails project: `cd backend-rails-api`
- Install dependencies with `bundle install`
- Add `.env` file in `backend-rails-api` folder root:
```
SHOPIFY_API_KEY=********************************
SHOPIFY_API_SECRET=shpss_********************************
SHOPIFY_ACCESS_TOKEN=shppa_********************************
SHOP_URL=[SHOP_NAME].myshopify.com
DB_USERNAME=******
DB_PASSWORD=******
DB_HOST=localhost
DB_PORT=5433
```

## Backend Database
This is the ERD from database modelation:
<br/>
<a href="https://github.com/anyelopetit/shipit-test/blob/rails_erd_installation/backend-rails-api/erd.pdf">
  <img src="https://user-images.githubusercontent.com/19691938/123675400-aa1c7480-d810-11eb-87fd-79462feed7d2.png" alt="Logo" width="300" height="600">
</a>
1. Create database: `$ rails db:create`
2. Migrate database: `$ rails db:migrate`
3. Populate database: `$ rails db:seed`

## Backend Server
1. Run server: `$ rails s`
2. Create [ngrok](https://ngrok.com) instance pointing to `localhost:3000`: `[path_to_ngrok]/ngrok http 3000`
3. Save the URL generated by ngrok ⬆ to use it later in React app

## Backend Tests
Run tests: `$ rspec`

# Frontend with React App

## Frontend Requeriments
- Yarn 1.22.5

## Frontend Installation
- Open another terminal tab
- Open React project in this new tab: `cd ../frontend-react-bootstrap`
- Install dependencies: `$ yarn install`
- Add `.env` file in `frontend-react-bootstrap` folder root and added it the saved ngrok URL:
```
REACT_APP_API_ROOT=https://[INSTANCE_ID].ngrok.io
```

## Frontend Server
1. Run server: `$ yarn start`
2. It will ask you if you wanna start the server in another port than 3000: answer Y (yes)
3. It will run the server in [localhost:3001](http://localhost:3001)
