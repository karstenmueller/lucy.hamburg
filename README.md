# lucy.hamburg

## hugo

Hugo site template in directory "site".

Create site template:
~~~shell
hugo new site site
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git site/themes/ananke
~~~

Create first post:
~~~shell
cd site
mkdir -p content/en
hugo new content/en/about.md 
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
