
# Formatter

- Python -> `autoflake + isort + black`
- PHP -> `pint (psr12)`
- JavaScript -> `js-beautify`
- CSS -> `css-beautify`
- JSON -> `jq`
- Yaml -> `yamlfix`


## Requirements

- Docker 🐳


## Installation


To run as a CLI

```sh
curl -o ~/formatter https://raw.githubusercontent.com/choval/formatter/master/formatter
chmod +x ~/formatter
mv ~/formatter ~/.local/bin/formatter
```

Move to a bin path like ~/bin or ~/local/bin or ~/.local/bin


### Update

```sh
docker pull ghcr.io/choval/formatter
```


### Uninstall

```sh
# Remove the script
rm `which formatter`
# Remove the hook
rm .git/hooks/pre-commit
docker rmi ghcr.io/choval/formatter
```

## Usage

With installed binary, will format all files (unlimited depth) in the 
current directory and format all files.

> [!CAUTION]
> It will not prompt or wait for confirmation!


```sh
formatter [PATH]
```

Directly through docker.

```sh
docker run -v `pwd`:/src ghcr.io/choval/formatter /src
```

## License

MIT, see [LICENSE](./LICENSE).

