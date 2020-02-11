#!/usr/bin/env bash

# Helper function to get latest archive release for macOS
download_and_install_from_github() {
  darwin_url=$(curl -s -S "https://api.github.com/repos/$1/releases/latest" | grep browser_download_url | grep -i 'darwin' | cut -d '"' -f 4)
  printf "Installing from:\n$darwin_url\n"

  if [[ $darwin_url == *.tar.gz ]]
  then
    curl -L -o provider.tar.gz $darwin_url
    tar -xf provider.tar.gz -C ~/.terraform.d/plugins
  	rm provider.tar.gz
  elif [[ $darwin_url == *.zip ]]
  then
    curl -L -o provider.zip $darwin_url
    unzip -qq -o provider.zip -d ~/.terraform.d/plugins
    rm provider.zip
  else
  	tput setaf 1; printf "Unsupported archive filetype, skipping.\n"; tput sgr0
  	return
  fi
  
  printf "Done.\n"
}

# Create plugin directory if not present
mkdir -p ~/.terraform.d/plugins

download_and_install_from_github "mingfang/terraform-provider-k8s"
download_and_install_from_github "mrparkers/terraform-provider-keycloak"