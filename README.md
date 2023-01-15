# Porkbun Dynamic DNS Client

This repository contains a [Nix](https://nixos.org/nix/) flake that wraps the Python version of the [Porkbun Dynamic DNS](https://github.com/porkbun-ddns/porkbun-ddns) client.

Currently skoobasteeve's [fork](https://github.com/skoobasteeve/porkbun-dynamic-dns-python/tree/ddns-no-delete-unless-change) is used. 

## Usage

Once the flake is installed, you can call the `porkbun-ddns` script like this:

~~~
porkbun-ddns </path/to/config_file.json> <root domain> <optional: subdomain>
~~~


The `config_file.json` should contain your Porkbun API key and other settings. The `root domain` and `subdomain` arguments are used to specify the domain you want to update.

For example, if you want to update the IP address for the subdomain `home` of the domain `example.com`, you would run the following command:

~~~
porkbun-ddns /path/to/config.json example.com home
~~~


## Additional Information

Please refer to the [Porkbun Dynamic DNS](https://github.com/porkbun-ddns/porkbun-ddns) for further information on how to use the client.
