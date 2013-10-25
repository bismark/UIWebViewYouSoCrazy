UIWebViewYouSoCrazy
===================

Given some arbitrary [HTML](https://github.com/bismark/UIWebViewYouSoCrazy/blob/master/UIWebViewYouSoCrazy/derp.html), I want my UIWebView to render "correctly".

## In Firefox ("correct"):

![firefox](https://raw.github.com/bismark/UIWebViewYouSoCrazy/master/firefox.png)

## Default UIWebView ("incorrect"):

![default](https://raw.github.com/bismark/UIWebViewYouSoCrazy/master/wrong1.png)

## WebView with scalesPageToFit == YES ("incorrect"):

![scalesPageToFit](https://raw.github.com/bismark/UIWebViewYouSoCrazy/master/wrong2.png)

## Injecting a meta viewport tag with width=device-width ("incorrect"):

![viewport](https://raw.github.com/bismark/UIWebViewYouSoCrazy/master/viewport.png)

## A "hack" which renders the UIWebView twice ("correct"):

![hack](https://raw.github.com/bismark/UIWebViewYouSoCrazy/master/hack.png)

Is there a more sane option?
