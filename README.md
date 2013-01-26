# Hemingway

Hemingway can translate a very rigid subset of LaTeX commands into HTML markup that can then be styled at the user's whim.

[![Build Status](https://travis-ci.org/griffinmyers/hemingway.png?branch=master)](https://travis-ci.org/griffinmyers/hemingway)

## Installation

Add this line to your application's Gemfile:

    gem 'hemingway'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hemingway

## Usage

First, instantiate the parser. 

    parser = Hemingway::Parser.new

Next, chuck some Latex markup into it. 

    result = parser.parse("\\emph{hey}")

Finally, convert the result to html markup. 

    markup = result.html

#### Supported Syntax

###### Newlines

Delimits paragraphs

    "wookie\n\nbreakfast" ==> <p>wookie></p><p>breakfast</p>




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
