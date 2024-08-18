
# Formatter

- Python -> `autoflake + isort + black`
- PHP -> `pint (psr12)`
- JavaScript -> `js-beautify`
- CSS -> `css-beautify`
- JSON -> `jq`
- Yaml -> `yamlfix`


## Requirements

```
docker
```


## Installation

```sh
curl https://raw.githubusercontent.com/choval/formatter/master/formatter
chmod +x formatter
mv formatter ~/.local/bin/formatter
```

### Update

```sh
docker pull ghcr.io/choval/formatter
```

### Uninstall

```sh
rm ~/.local/bin/formatter
docker rmi ghcr.io/choval/formatter
```

## Usage

With installed binary, will format all files (unlimited depth) in the 
current directory and format all files.

> [!CAUTION]
> It will not prompt or wait for confirmation!


```sh
formatter
```

Directly through docker.

```sh
docker run -v `pwd`:/src ghcr.io/choval/formatter /src [6]
```

## License

MIT, see [LICENSE](./LICENSE).
