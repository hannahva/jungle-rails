# Jungle

A mini e-commerce application built during week 6 of Lighthouse Labs' 8-week Web Development Bootcamp. Introduced as an unfamiliar existing code-base with feature requests and bug fixes, to learn to navigate the Rails 4.2 framework.

## Jungle in Action
![login](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/login.png)
![category menu](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/category%20menu.png)
![category view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/category%20view.png)
![product view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/logged-in%20review.png)
![cart view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/cart%20view.png)
![order view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/order%20page.png)
![admin menu](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/admin%20menu.png)
![admin products view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/admin%20products.png)
![admin category view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/admin%20categories.png)
![logged out product view](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/logged-out%20review.png)
![empty cart](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/empty%20cart%20.png)
![sold out badge](https://raw.githubusercontent.com/hannahva/jungle-rails/f7f42426488072df1d2e09447e2498cb2f0f2da2/docs/sold%20out%20badge.png)





## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>
##Stack

 - Ruby
 - Rails
 - CSS using Sass pre-processor

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
