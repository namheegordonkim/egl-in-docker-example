#!/bin/bash
set -e

# For the minimal example, we'll use vispy and call vispy.use('egl')
pip install pyopengl vispy

# Some weird path search error for WSL monkey-patched
# See also: https://forum.step.esa.int/t/snap-9-gui-mesa-glibcxx-error-in-headless-linux-server-using-vnc/36797/5
mkdir /usr/lib/dri
ln -s /usr/lib/x86_64-linux-gnu/dri/swrast_dri.so /usr/lib/dri/
ln -s -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /opt/miniconda3/bin/../lib/libstdc++.so.6

exec "$@"

