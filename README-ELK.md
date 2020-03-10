# Guitarix 

Modified for headless plugin build for [Elk Audio OS](https://elk.audio)

## Building Instructions

1. Set up the cross-compilation toolchain with:

   ```bash
   $ unset LD_LIBRARY_PATH
   $ source /path/to/environment-setup-cortexa7t2hf-neon-vfpv4-elk-linux-gnueabi
   ```

2. Configure in the following way:
   ```bash
   $ ./waf --cxxflags-release="-O2 -pipe -ffast-math -feliminate-unused-debug-types -funroll-loops -mvectorize-with-neon-quad -g" --no-faust --no-ladspa --no-lv2-gui --lv2-only --disable-sse --no-bluez configure

   Optionally you can specify a custom installation path with `--prefix=/your-custom-path`

3. Build:
    ```bash
    $ ./waf build -j`nproc`
    ```

4. Install:
    $ ./waf install

## Extra notes

Some plugins might not work at the moment because they require the LV2 worker thread extension which is currently not supported in SUSHI 0.10.0 but is under development.

