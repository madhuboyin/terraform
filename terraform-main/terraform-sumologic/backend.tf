terraform {
  backend "gcs" {
    credentials = "./creds.json"
  }
}