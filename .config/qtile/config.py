#
# Copyright (c) 2015 Rodolphe Breard
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#


from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile import layout, bar, widget, hook
from libqtile.command import lazy
from glob import glob
import subprocess
import random
import os


class ConfigWrapper:
    def __init__(self):
        self.mod = 'mod4'
        self.term = 'urxvt'
        self.border_focus = '#424242'
        self.date_format = '%a %d %B %Y %H:%M'

        self.keys = []
        self.groups = []
        self.layouts = []

    def _add_key(self, key, action, *, extra_mod=None, no_mod=False):
        mod = []
        if not no_mod:
            mod.append(self.mod)
        if extra_mod:
            mod.append(extra_mod)
        k = Key(mod, key, action)
        self.keys.append(k)

    def _add_group(self, name, position):
        grp = Group(name, position=position)
        self.groups.append(grp)
        access_key = str(position + 1)
        self._add_key(access_key, lazy.group[name].toscreen())
        self._add_key(access_key, lazy.window.togroup(name), extra_mod='shift')

    def set_wallpaper(self):
        images = glob(os.path.expanduser('~/pictures/wallpapers/enabled/*'))
        if images:
            image = random.choice(images)
            subprocess.call(['feh', '--bg-fill', image])

    def set_keys(self):
        self._add_key('j', lazy.layout.up())
        self._add_key('k', lazy.layout.down())
        self._add_key('Tab', lazy.layout.next())
        self._add_key('space', lazy.layout.rotate(), extra_mod='shift')
        self._add_key('space', lazy.next_layout())
        self._add_key('Right', lazy.screen.next_group())
        self._add_key('Left', lazy.screen.prev_group())
        self._add_key('w', lazy.window.kill())
        self._add_key('Return',  lazy.spawn(self.term))
        self._add_key('l', lazy.spawn('xscreensaver-command --lock'))
        self._add_key(
            'Print',
            lazy.spawn("scrot -e 'mv $f ~/pictures/ 2>/dev/null'"),
            no_mod=True
        )
        self._add_key('r', lazy.spawncmd())
        self._add_key('r', lazy.restart(), extra_mod='control')
        self._add_key('q', lazy.shutdown(), extra_mod='control')
        return self.keys

    def set_groups(self):
        names = ['main', 'www', 'remote', 'email', 'media', 'misc']
        for i, name in enumerate(names):
            self._add_group(name, i)
        return self.groups

    def set_layouts(self):
        self.layouts = [
            layout.MonadTall(border_focus=self.border_focus, align=1),
            layout.Max(),
            layout.Stack(border_focus=self.border_focus),
            layout.Floating(border_focus=self.border_focus),
        ]
        return self.layouts

    def set_screens(self):
        screens = [
            Screen(
                top=bar.Bar(
                    [
                        widget.GroupBox(),
                        widget.Prompt(),
                        widget.WindowName(),
                        widget.Systray(),
                        widget.Clock(format=self.date_format),
                    ],
                    30,
                ),
            ),
        ]
        return screens

    def set_mouse(self):
        mouse = [
            Drag(
                [self.mod],
                'Button1',
                lazy.window.set_position_floating(),
                start=lazy.window.get_position()
            ),
            Drag(
                [self.mod],
                'Button3',
                lazy.window.set_size_floating(),
                start=lazy.window.get_size()
            ),
            Click(
                [self.mod],
                'Button2',
                lazy.window.bring_to_front()
            )
        ]
        return mouse


@hook.subscribe.startup
def startup():
    cnf = ConfigWrapper()
    cnf.set_wallpaper()


if __name__ in ['config', '__main__']:
    cnf = ConfigWrapper()
    groups = cnf.set_groups()
    layouts = cnf.set_layouts()
    screens = cnf.set_screens()
    mouse = cnf.set_mouse()
    keys = cnf.set_keys()

    dgroups_key_binder = None
    dgroups_app_rules = []
    main = None
    follow_mouse_focus = True
    bring_front_click = False
    cursor_warp = False
    floating_layout = layout.Floating()
    auto_fullscreen = True
    wmname = 'LG3D'
    widget_defaults = {
        'font': 'Arial',
        'fontsize': 16,
        'padding': 3,
    }
