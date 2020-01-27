---
title: Simple-a hugo theme - small edits to personalize.
author: Megan Wylie
date: '2020-01-11'
slug: simple-a-hugo-theme-small-edits-to-personalize
categories: []
tags: []
Categories: []
Description: ''
Tags: ["Hugo", "simple-a", "Markdown", "website setup"]
---


Hello again! New year, and I'm already getting into more complicated hugo/blogdown projects. 

Over the holidays I'd been blogging and encountered some (unfixable to me) issues with the first site I generated. After consultation with colleagues and many many hours on SO and various other websites, I decided to start over.

Upon reading through the [blogdown book](https://bookdown.org/yihui/blogdown/other-themes.html) again, I decided to try one of their simple recommended themes! I went with [simple-a](https://github.com/AlexFinn/simple-a) because it looked nice and was recommended by the blogdown folks. It was a quick decision to try something new. 

It doesn't have much documentation, so here is how I changed some of the simple aspects of the blog.

# Header and footer names

The site has *Alex Finn* written all over it (thanks for making the theme!). I immediatly wanted to make sure that I could personalize the content and make the site cohestively mine. 

All of the website HTML documents are in the theme folder.

~themes\simple-a\layouts\partials

# What to change

There were a few key areas I wanted to update:
- the website name in the tab
- the images
- the copyright and year

## Website name

To do this, I had to change the data in the metadata html. This also allowed me to change the website author metadata.

## Images

The image above the blog posts can be changed in the menu.html file. I was able to change the image to my profile picture, however, it will require some format changes in the future. 

## Copyright and year

I'm not sure if I'm supposed to change this! Simple-a is not my theme, but all of the content is mine.

Note to self, add a theme link!

The file to change the copyright and year information is the footer.html. To be safe I added a sentence that references the simple-a theme I'm basing my website on.

I'll continue to add more notes as I go along. :) 

