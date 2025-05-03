Requirements

Ruby >= 3.1.1
Rails >= 7.2
PostgreSQL


Clone the repository
run in console
git clone https://github.com/Nageshwardahare/diatoz_task.git

cd 

bundle install

rails assets:precompile

setup database.yml file (user_name and password)
rails db:create

rails db:migrate

rails db:seed ( This will create a one admin, doctor and receptienist user)

rails server