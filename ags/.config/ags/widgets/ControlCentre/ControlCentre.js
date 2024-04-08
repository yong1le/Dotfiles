import PopupWindow from "../PopupWindow.js";
import { Brightness } from "./widgets/Brightness.js";
import { MediaPlayer } from "./widgets/Media.js";
import { Volume, Mic } from "./widgets/Volume.js";
import { Battery, PowerProfiles } from "./widgets/Battery.js";
import { Session } from "./widgets/Session.js";
import { Bluetooh, Wifi } from "./widgets/Wireless.js";
import {
  ColorPicker,
  ScreenshotClipboard,
  ScreenshotSave,
} from "./widgets/Utilities.js";
import {
  NotificationHeader,
  NotificationCenter,
} from "./widgets/Notificatons.js";

const mpris = await Service.import("mpris");
const notifications = await Service.import("notifications");

function SystemButtons() {
  return Widget.Box({
    class_name: "system-buttons-container",
    spacing: 8,
    children: [
      Widget.Box({
        css:
          `background-image: url("${App.configDir}/widgets/ControlCentre/images/profile.jpg");` +
          "min-width: 100px;" +
          "min-height: 100px;" +
          "background-size: contain;" +
          "background-repeat: no-repeat;" +
          "background-position: center;" +
          "border-radius: 50%",
      }),
      Battery(),
      Session(),
    ],
  });
}

function SliderControls() {
  return Widget.Box({
    class_name: "slider-controls-container",
    vertical: true,
    children: [Volume(), Brightness()],
  });
}

function ControlButtons() {
  return Widget.Box({
    spacing: 8,
    homogeneous: true,
    vertical: true,
    class_name: "control-buttons-container",
    children: [
      Widget.Box({
        spacing: 8,
        homogeneous: true,
        children: [Wifi(), Bluetooh()],
      }),
      Widget.Box({
        spacing: 8,
        homogeneous: true,
        children: [Mic(), PowerProfiles()],
      }),
    ],
  });
}

function Utilities() {
  return Widget.Box({
    spacing: 16,
    homogeneous: true,
    class_name: "utilities-container",
    children: [ColorPicker(), ScreenshotClipboard(), ScreenshotSave()],
  });
}

function QuickSettings() {
  return Widget.Box({
    class_name: "popup-inner",
    spacing: 16,
    vertical: true,
    children: [
      SystemButtons(),
      SliderControls(),
      ControlButtons(),
      Utilities(),
    ],
  });
}

function Media() {
  return Widget.Scrollable({
    hscroll: "never",
    class_name: "popup-inner media-container",
    visible: mpris.bind("players").as((p) => p.length > 0),
    child: MediaPlayer(),
  });
}

function Notifications() {
  return Widget.Box({
    vertical: true,
    spacing: 16,
    class_name: "popup-inner notifications-container",
    visible: notifications.bind("notifications").as((n) => n.length > 0),
    children: [
      NotificationHeader(),
      Widget.Scrollable({
        hscroll: "never",
        child: NotificationCenter(),
      }),
    ],
  });
}

export default function ControlCentre() {
  return PopupWindow({
    name: "controlcentre",
    anchor: ["top", "right"],
    childSetup: () => {
      App.applyCss(`${App.configDir}/widgets/ControlCentre/ControlCentre.css`);
    },
    child: Widget.Box({
      class_name: "controlcentre",
      vertical: true,
      children: [QuickSettings(), Notifications(), Media()],
    }),
  });
}
