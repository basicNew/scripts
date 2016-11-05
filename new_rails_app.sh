#!/bin/bash  

if [ -z "$1" ]
  then
    echo "Project name required"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "Ruby version required"
    exit 1
fi

PROJECT_NAME=$1
RUBY_VERSION=$2

if [ -d "$PROJECT_NAME" ]
  then
    echo "Direcotry $PROJECT_NAME already existst. Please remove it and re-run the script"
    exit 1
fi

mkdir $PROJECT_NAME
cd $PROJECT_NAME

source ~/.rvm/scripts/rvm
RVM_COMMAND="rvm use ruby-"$RUBY_VERSION"@"$PROJECT_NAME" --create"
eval $RVM_COMMAND
echo $PROJECT_NAME > .ruby-gemset
echo $RUBY_VERSION > .ruby-version

gem install bundler

gem install rails --no-ri --no-rdoc

rails new . -T

cat <<EOT >> Gemfile

group :development, :test do
  gem 'rspec-rails'
end
EOT

bundle install

rails generate rspec:install


