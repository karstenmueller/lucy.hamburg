# lucy.hamburg

## hugo

Hugo site template in directory "site".

Create site template:
~~~shell
hugo new site site
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git site/themes/ananke
git submodule add https://github.com/statichunt/iwriter-hugo site/themes/iwriter
~~~

Create first post:
~~~shell
cd site
hugo new content content/posts/my-first-post.md
cat > content/posts/my-first-post.md
++
title = 'My First Post'
date = 2024-01-14T07:07:07+01:00
draft = true
+++
## Introduction
^D
~~~


~~~shell
hugo server --buildDrafts
hugo server -D
~~~

## terraform

Terraform files in directory "terraform".

~~~shell
terraform init
terraform validate
terraform plan
~~~
