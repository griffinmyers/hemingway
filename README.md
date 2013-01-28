# Hemingway

Hemingway can translate a very rigid subset of LaTeX commands into HTML markup that can then be styled at the user's whim. 

The parser was created using Treetop, so it might be useful to consult the [Treetop Documentation](http://treetop.rubyforge.org/syntactic_recognition.html) to learn more about the inner workings. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hemingway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hemingway

## Usage

First, instantiate the parser. 

```ruby
parser = Hemingway::Parser.new
```

Next, chuck some Latex markup into it. 

```ruby
result = parser.parse("do, or do not, there is no \\emph{try}")
```

Finally, convert the result to html markup. 

```ruby
markup = result.html
```

If something goes really wrong, the parse method will return `nil`. If that's the case, you can say something like

```ruby
parser.failure_reason
```

to figure out what happened. `Hemingway::Parser` is a delegator for a Treetop parser, so check out the [Treetop Documentation](http://treetop.rubyforge.org/syntactic_recognition.html) to see what other useful methods you can use in case of something going wrong. 

## Supported Syntax
Here is a breakdown of supported latex and its markup equivalent. 
In most examples, I only show the interesting bits of conversion. Note that at the
top level, everything is wrapped in 

```html
<div class='document'></div>
```    

but I'm omitting that detail from the examples for brevity. Throughout this, 
the `:` operator simply says the LHS maps to the RHS. 

###### Newlines

Delimits paragraphs

```html
wookie\n\nbreakfast : <p>wookie></p><p>breakfast</p>
```

###### Tags

Adds inline styling

```html
That’s no moon, \emph{it’s a space station.} : That’s no moon, <em>it’s a space station.</em>

\textbf{The Force} : <strong>The Force</strong>
    
\texttt{R2-D2} : <code>R2-D2</code>
    
\textsc{Death Star} : <span class='textsc'>Death Star</span>
```

###### Maths

Adds math symbols

```html
$\Delta$ : &Delta;
```


###### Special Characters

```html
\# : # 
\$ : $ 
\% : % 
\& : & 
\_ : _
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

---
[![Build Status](https://travis-ci.org/griffinmyers/hemingway.png?branch=master)](https://travis-ci.org/griffinmyers/hemingway)
