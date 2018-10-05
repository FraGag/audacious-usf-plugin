audacious-usf-plugin
====================

The USF plugin (N64) for audacious

# About the plugin

The plugin was removed sometime in 2012 (i think) from the [audacious-plugins](https://github.com/audacious-media-player/audacious-plugins) repo. 

Then lucashpandolfo forked and restored the plugin for [personal use](https://github.com/lucashpandolfo/audacious-plugins).

It was further forked and made compatible with Audacious 3.7.x by Sascha Klick in 2018.

After having to reinstall audacious to a new pc, i found myself needing once agin the plugin, so i cleaned the sources, removed all the plugins except the usf one.

# Installation

```bash
> ./autogen.sh
> ./configure
> make
```

Then copy ```src/usf/usf.so``` to ```/usr/lib{64}/audacious/Input/```

