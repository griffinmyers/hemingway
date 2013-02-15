# Hemingway [![Build Status](https://travis-ci.org/griffinmyers/hemingway.png?branch=master)](https://travis-ci.org/griffinmyers/hemingway)

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
<div class='entry'></div>
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

Or some vertical padding

```html
\vspace{5mm} : <div class='vspace5'></div>
```

###### Maths

Adds math symbols

```html
$\Gamma$" : &Gamma;
$\Delta$" : &Delta;
$\Theta$" : &Theta;
$\Lambda$" : &Lambda;
$\Xi$" : &Xi;
$\Pi$" : &Pi;
$\Sigma$" : &Sigma;
$\Upsilon$" : &Upsilon;
$\Phi$" : &Phi;
$\Psi$" : &Psi;
$\Omega$" : &Omega;
$\alpha$" : &alpha;
$\beta$" : &beta;
$\gamma$" : &gamma;
$\delta$" : &delta;
$\epsilon$" : &epsilon;
$\zeta$" : &zeta;
$\eta$" : &eta;
$\theta$" : &theta;
$\iota$" : &iota;
$\kappa$" : &kappa;
$\lambda$" : &lambda;
$\mu$" : &mu;
$\nu$" : &nu;
$\xi$" : &xi;
$\pi$" : &pi;
$\rho$" : &rho;
$\varsigma$" : &sigmaf;
$\sigma$" : &sigma;
$\tau$" : &tau;
$\upsilon$" : &upsilon;
$\phi$" : &phi;
$\chi$" : &chi;
$\psi$" : &psi;
$\omega$" : &omega;
```


###### Special Characters

```html
\# : # 
\$ : $ 
\% : % 
\& : & 
\_ : _
\{ : {  
\} : } 
```

###### Blocks

You can make lists with `itemize`, `description`, or `enumerate`. 

```html
\begin{itemize}\item Wookie \item Jedi \end{itemize} : <ul><li>Wookie </li><li>Jedi </li></ul>

\begin{enumerate} \item Frodo \item Sam \end{enumerate} : <ol><li>Frodo </li><li>Sam </li></ol>

\begin{description} \item Ginger-Nut \item Turkey \end{description} : <dl><dd>Ginger-Nut </dd><dd>Turkey </dd></dl>
```

Add labels to a list with `\item[label]`: 

```html
\begin{itemize}\item[bros] before hoes \item \n [chicks] before dicks \end{itemize} : <ul><li><span class='list-label'>bros</span> before hoes </li><li><span class='list-label'>chicks</span> before dicks </li></ul>

\begin{description} \item [Frodo] Intrepid Adventuerer \item [Sam] Faithful Companion \end{description} : <dl><dd><dt>Frodo</dt> Intrepid Adventuerer </dd><dd><dt>Sam</dt> Faithful Companion </dd></dl>
```

Go ahead, nest lists in all sorts of interesting ways. No reason you couldn't chuck some empahsized text in a label either. 

Enter in preformatted text: 

```html
\begin{verbatim} don't  we  \n \n all wish \n \n   for a little sleep? \end{verbatim}") : <pre>don't  we  \n \n all wish \n \n   for a little sleep? </pre>
```

###### Footnotes

Putting in a bunch of footnotes inline with your content is an awesome idea. All footnotes within an entry
will be yanked out, linked with an anchor tag, and placed after all paragraphs in the entry. Naturally 
you can put just about whatever you want in a footnote (save another footnote). 

I might have made a bad assumption here and used the `<sup>` tag for the footnote number because it assumes formatting, something I've been trying to avoid. If you'd like that assumption removed, you're just a pull request away. 

For example this latex markup:

> So we met up with Han and saw his ship, The Millenium Falcon\footnote{a total piece of junk}. I had no idea how that thing was supposed to get us to Alderaan\footnote{location of the \emph{hidden rebel base}}. 

> On board we found homely accomodations including a Dejarik\footnote{much like chess} set that I indluged in with Chewbacca\footnote{Han's carpety first mate}.

Renders to this html: 

```html
<div class='entry'>
  <p>
    So we met up with Han and saw his ship, The Millenium Falcon<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a>. I had no idea how that thing was supposed to get us to Alderaan<a href='#footnote2'><span class='inline-footnote-number'><sup>2</sup></span></a>. 
  </p>
  <p>
    On board we found homely accomodations including a Dejarik<a href='#footnote3'><span class='inline-footnote-number'><sup>3</sup></span></a> set that I indluged in with Chewbacca<a href='#footnote4'><span class='inline-footnote-number'><sup>4</sup></span></a>.
  </p>

  <div id='footnote1' class='footnote'>
    <span class='footnote-number'><sup>1</sup></span>a total piece of junk
  </div>

  <div id='footnote2' class='footnote'>
    <span class='footnote-number'><sup>2</sup></span>location of the <em>hidden rebel base</em>
  </div>

  <div id='footnote3' class='footnote'>
    <span class='footnote-number'><sup>3</sup></span>much like chess
  </div>

  <div id='footnote4' class='footnote'>
    <span class='footnote-number'><sup>4</sup></span>Han's carpety first mate
  </div>

</div>
```

And looks like this: 

<div class='entry'>
  <p>
    So we met up with Han and saw his ship, The Millenium Falcon<a href='#footnote1'><span class='inline-footnote-number'><sup>1</sup></span></a>. I had no idea how that thing was supposed to get us to Alderaan<a href='#footnote2'><span class='inline-footnote-number'><sup>2</sup></span></a>. 
  </p>
  <p>
    On board we found homely accomodations including a Dejarik<a href='#footnote3'><span class='inline-footnote-number'><sup>3</sup></span></a> set that I indluged in with Chewbacca<a href='#footnote4'><span class='inline-footnote-number'><sup>4</sup></span></a>.
  </p>

  <div id='footnote1' class='footnote'>
    <span class='footnote-number'><sup>1</sup></span>a total piece of junk
  </div>

  <div id='footnote2' class='footnote'>
    <span class='footnote-number'><sup>2</sup></span>location of the <em>hidden rebel base</em>
  </div>

  <div id='footnote3' class='footnote'>
    <span class='footnote-number'><sup>3</sup></span>much like chess
  </div>

  <div id='footnote4' class='footnote'>
    <span class='footnote-number'><sup>4</sup></span>Han's carpety first mate
  </div>

</div>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
