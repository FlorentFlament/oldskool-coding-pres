This is a presentation about "Oldskool coding on an Atari
2600/VCS". It is meant to be transformed into an [impress.js
presentation][1] by using [hovercraft][2] (which doc is available on
[readthedocs.io][3]).

Install
=======

```
$ virtualenv -p $(which python3) venv
$ source venv/bin/activate
$ pip install -r requirements.txt
```

Build
=====

```
$ hovercraft oldskool-coding.rst out/
```


[1]: https://github.com/impress/impress.js/
[2]: https://github.com/regebro/hovercraft
[3]: https://hovercraft.readthedocs.io/en/latest/index.html
