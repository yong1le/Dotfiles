import PopupWindow from "../PopupWindow.js";
import { Brightness } from "./widgets/Brightness.js";
import { MediaPlayer } from "./widgets/Media.js";
import { Volume, Mic } from "./widgets/Volume.js";
import { Battery, PowerProfiles } from "./widgets/Battery.js";
import { Session } from "./widgets/Session.js";

const mpris = await Service.import("mpris");
const players = mpris.bind("players");

function SystemButtons() {
  return Widget.Box({
    class_name: "system-buttons-container",
    children: [
      Widget.Label({
        css: "font-size: 70px; font-weight: bold; margin-right: 20px",
        label: "YL",
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
    class_name: "control-buttons-container",
    children: [Mic(), PowerProfiles()],
  });
}

function QuickSettings() {
  return Widget.Box({
    class_name: "popup-inner",
    spacing: 16,
    vertical: true,
    children: [SystemButtons(), SliderControls(), ControlButtons()],
  });
}

function Media() {
  return Widget.Box({
    class_name: "popup-inner",
    visible: players.as((p) => p.length > 0),
    children: [MediaPlayer()],
  });
}

function Notifications() {
  return Widget.Box({});
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
