# kconfig-declarative

Configure KDE Plasma declaratively! Usage:

```
$ tee manifest.json << EOF
{
  "files": {
    "kwinrc": {
      "Desktops": {
        "Number": 4
      }
    },
		"baloofilerc": {
			"Basic Settings": {
				"Indexing-Enabled": false
			}
		}
  }
}
EOF

$ kconfig-declarative apply ./manifest.json
```

This program is part of [nix-maid](https://github.com/viperML/nix-maid), which provides an easy user interface for kconfig-declarative:

```nix
{ config, pkgs, ...}: {

  users.users.nixos = {
    isNormalUser = true;

    maid = {
      kconfig.settings = {
        kwinrc = {
          Desktops.Number = 4;
        };
        baloofilerc = {
          "Basic Settings".Indexing-Enabled = false;
        };
      };
    };
  };

}
```

## Why?

[plasma-manager](https://github.com/nix-community/plasma-manager) already exists, but:

- The implementation is bad. They parse and encode the KDE config files as text, instead of using the C++ API.
- It is coupled to home-manager, which I don't use.
