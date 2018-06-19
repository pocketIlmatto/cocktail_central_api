## Getting Started

1. Clone this repo with git:

        git clone git@github.com:pocketIlmatto/cocktail_central_api.git

2. Install necessary gems:

        bundle install

3. Setup Development Database
        rake db:drop; rake db:create; rake db:migrate; rake test:prepare
        rake db:seed

4. Run the application:
        rails s
