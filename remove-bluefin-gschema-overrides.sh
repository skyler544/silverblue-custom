#!/bin/bash

set -ouex pipefail

rm /usr/share/glib-2.0/schemas/zz0-bluefin-modifications.gschema.override
rm /usr/share/glib-2.0/schemas/zz1-bluefin-modifications-mutter-exp-feats.gschema.override

glib-compile-schemas /usr/share/glib-2.0/schemas/
