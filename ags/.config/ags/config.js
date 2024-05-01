import OSD from "./widgets/OSD/OSD.js";
import Bar from "./widgets/Bar/Bar.js";
import ControlCentre from "./widgets/ControlCentre/ControlCentre.js";
import NotificationPopups from "./widgets/Notification/Notification.js";
import PopupCalendar from "./widgets/Calendar/Calendar.js";
import AppLauncher from "./widgets/AppLauncher/AppLauncher.js";

import setupGlobals from "./scripts/globals.js";

setupGlobals();

App.config({
  style: "./style.css",
  windows: [
    Bar(0),
    Bar(1),
    ControlCentre(),
    NotificationPopups(0),
    NotificationPopups(1),
    OSD("volume"),
    OSD("brightness"),
    OSD("mic"),
    OSD("ppd"),
    PopupCalendar(),
    AppLauncher(),
  ],
});

