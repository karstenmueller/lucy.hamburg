# lucy.hamburg

## hugo

Hugo site template in directory "site".

Create site template:
~~~shell
hugo new site site
git submodule add https://github.com/adityatelange/hugo-PaperMod site/themes/PaperMod
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

## Delete submodule

To remove a submodule you need to:

- Delete the relevant section from the .gitmodules file.
- Stage the .gitmodules changes git add .gitmodules
- Delete the relevant section from .git/config.
- Run "git rm --cached path_to_submodule" (no trailing slash).
- Run "rm -rf .git/modules/path_to_submodule" (no trailing slash).
- Commit git commit -m "Removed submodule "
- Delete the now untracked submodule files rm -rf path_to_submodule

## References

- https://github.com/lookscanned/lookscanned-blog/tree/main
- https://kpwn.de/2021/09/how-to-set-up-this-blog/
