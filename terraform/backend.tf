terraform {
  cloud {
    organization = "arairyus"

    workspaces {
      name = "backstage"
    }
  }
}