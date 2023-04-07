from __future__ import annotations

import dbus

from libqtile import bar, images
from libqtile.log_utils import logger
from libqtile.widget import base

from xdg import IconTheme


def dbus_battery_icon(theme="Adwaita", size=32):
    UPOWER = "org.freedesktop.UPower"
    PATH = "/org/freedesktop/UPower"
    bus = dbus.SystemBus()
    proxy = bus.get_object(UPOWER, PATH)
    interface = dbus.Interface(proxy, UPOWER)
    for device in interface.EnumerateDevices():
        logger.warn(f"found device {device}")
        if "/battery" in device:
            bat_proxy = bus.get_object(UPOWER, device)
            bat_interface = dbus.Interface(
                bat_proxy,
                "org.freedesktop.DBus.Properties",
            )
            icon = bat_interface.Get(
                "org.freedesktop.UPower.Device",
                "IconName",
            )
            logger.warn(f"found icon {icon}")
            break
    else:
        logger.warn("icon fallback")
        icon = "battery-missing-symbolic"
    return IconTheme.getIconPath(
        icon + ".symbolic", theme=theme, size=size, extensions=["png"]
    )


def default_icon_theme() -> str:
    """Get the name of the default icon theme"""
    return "Adwaita"


class DBusBatteryIcon(base._Widget):
    """Battery life indicator widget."""

    orientations = base.ORIENTATION_HORIZONTAL
    defaults = [
        ("update_interval", 60, "Seconds between status updates"),
        ("icon_theme", default_icon_theme(), "XDG Icon theme name"),
        (
            "scale",
            1,
            "Scale factor relative to the bar height. Defaults to 1",
        ),
    ]  # type: list[tuple[str, Any, str]]

    def __init__(self, **config) -> None:
        base._Widget.__init__(self, length=bar.CALCULATED, **config)
        self.add_defaults(self.defaults)
        self.scale = 1.0 / self.scale  # type: float

        self.length_type = bar.STATIC
        self.length = 0
        self.surfaces = {}  # type: dict[str, Img]
        self.current_icon = None

    def timer_setup(self) -> None:
        self.update()
        self.timeout_add(self.update_interval, self.timer_setup)

    def _configure(self, qtile, bar) -> None:
        base._Widget._configure(self, qtile, bar)

    def setup_images(self) -> None:
        new_height = self.bar.height * self.scale
        if self.current_icon not in self.surfaces:
            img = images.Img.from_path(self.current_icon)
            img.resize(height=new_height)
            if img.width > self.length:
                self.length = int(img.width)
            self.surfaces[self.current_icon] = img.pattern

    def update(self) -> None:
        icon = dbus_battery_icon()
        if icon != self.current_icon:
            self.current_icon = icon
            self.draw()

    def draw(self) -> None:
        self.setup_images()
        self.drawer.clear(self.background or self.bar.background)
        self.drawer.ctx.set_source(self.surfaces[self.current_icon])
        self.drawer.ctx.paint()
        self.drawer.draw(
            offsetx=self.offset,
            offsety=self.offsety,
            width=self.length,
        )
