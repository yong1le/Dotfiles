import OSD from "./widgets/OSD/OSD.js";
import Bar from "./widgets/Bar/Bar.js";
import ControlCentre from "./widgets/ControlCentre/ControlCentre.js";
import NotificationPopups from "./widgets/Notification/Notification.js";
import PopupCalendar from "./widgets/Calendar/Calendar.js";
import AppLauncher from "./widgets/AppLauncher/AppLauncher.js";

const hyprland = await Service.import("hyprland");

import setupGlobals from "./scripts/globals.js";

setupGlobals();

App.config({
  style: "./style.css",
  windows: [
    hyprland.monitors.map((m) => Bar(m.id)),
    ControlCentre(),
    hyprland.monitors.map((m) => NotificationPopups(m.id)),
    OSD("volume"),
    OSD("brightness"),
    OSD("mic"),
    OSD("ppd"),
    PopupCalendar(),
    AppLauncher(),
  ],
});
