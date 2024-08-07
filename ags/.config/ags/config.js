// import OSD from "./widgets/OSD/OSD.js";
// import Bar from "./widgets/Bar/Bar.js";
// import ControlCentre from "./widgets/ControlCentre/ControlCentre.js";
// import NotificationPopups from "./widgets/Notification/Notification.js";
// import PopupCalendar from "./widgets/Calendar/Calendar.js";
// import AppLauncher from "./widgets/AppLauncher/AppLauncher.js";
import { AppLauncher, ClipboardLauncher, NetworkLauncher } from "./widgets/Launcher/Launcher.js";

// const hyprland = await Service.import("hyprland");
//
// import setupGlobals from "./scripts/globals.js";

// setupGlobals();

App.config({
  // style: "./style.css",
  windows: [
    // hyprland.monitors.map((m) => NotificationPopups(m.id)),
    // hyprland.monitors.map((m) => Bar(m.id)),
    // ControlCentre(),
    // OSD("volume"),
    // OSD("brightness"),
    // OSD("mic"),
    // OSD("ppd"),
    // PopupCalendar(),
    AppLauncher(),
    ClipboardLauncher(),
    NetworkLauncher(),
  ],
});
