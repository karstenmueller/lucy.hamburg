# Cloudflare project deployment and DNS record for the project
resource "cloudflare_pages_project" "my_project" {
  account_id = var.cloudflare_account_id

  build_config = {
    build_command       = "hugo build"
    destination_dir     = "../site"
    root_dir            = "/"
    web_analytics_tag   = "SECRET"
    web_analytics_token = "SECRET"
    build_caching       = true
  }

  # deployment_configs = {
  #   production_branch = "main"

  #   preview = {
  #     environment_variables = {
  #       CONFIG_FILE    = "_config_preview.yml"
  #       JEKYLL_ENV     = "development"
  #       BUNDLE_WITHOUT = ""
  #       RUBY_VERSION   = "3.2.6"
  #     }
  #     fail_open = true
  #   }
  #   production = {
  #     environment_variables = {
  #       CONFIG_FILE    = "_config.yml"
  #       JEKYLL_ENV     = "production"
  #       BUNDLE_WITHOUT = ""
  #       RUBY_VERSION   = "3.2.6"
  #     }
  #     fail_open = true
  #   }
  # }
  name              = "Sailing Lucy"
  production_branch = "main"
  source = {
    type = "github"

    config = {
      owner                         = "karstenmueller"
      repo_name                     = "lucy.hamburg"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_deployment_setting    = "all"
      preview_branch_includes       = ["*"]
      preview_branch_excludes       = ["main", "prod"]
    }
  }
}

resource "cloudflare_pages_domain" "my_project" {
  account_id   = var.cloudflare_account_id
  project_name = var.cloudflare_site_name
  name         = var.cloudflare_domain_name
}

resource "cloudflare_dns_record" "my_project" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  content = cloudflare_pages_project.my_project.subdomain
  type    = "CNAME"
  proxied = true
  ttl     = 60
}
