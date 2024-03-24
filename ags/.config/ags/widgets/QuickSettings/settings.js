import {
  BatteryDrawLabel,
  BatteryLabel,
  BatteryRemainingLabel,
  BatterySlider,
  PowerProfilesButton,
} from "../../parts/power.js";
import { VolumeLabel, VolumeSlider } from "../../parts/volume.js";
import { BacklightLabel, BacklightSlider } from "../../parts/backlight.js";

const WINDOW_NAME = "quicksettings";

function Battery() {
  return Widget.Box({
    class_name: "quicksettings-battery",
    spacing: 16,
    vertical: true,
    children: [
      Widget.Box({
        spacing: 8,
        children: [BatteryLabel(), BatterySlider()],
      }),
      Widget.Box({
        spacing: 16,
        children: [
          PowerProfilesButton(),
          BatteryDrawLabel(),
          BatteryRemainingLabel(),
        ],
      }),
    ],
  });
}

function Backlight() {
  return Widget.Box({
    class_name: "quicksettings-backlight",
    spacing: 8,
    children: [BacklightLabel(), BacklightSlider()],
  });
}

function Volume() {
  return Widget.Box({
    class_name: "quicksettings-volume",
    spacing: 8,
    children: [VolumeLabel(), VolumeSlider()],
  });
}

function Settings() {
  return Widget.Box({
    spacing: 32,
    class_name: "quicksettings-inner",
    vertical: true,
    children: [Volume(), Backlight(), Battery()],
  });
}

export default function QuickSettings() {
  return Widget.Window({
    class_name: "quicksettings",
    name: WINDOW_NAME,
    anchor: ["top", "right"],
    setup: (self) =>
      self.keybind("Escape", () => {
        App.closeWindow(WINDOW_NAME);
      }),
    visible: false,
    keymode: "exclusive",
    child: Settings(),
  });
}
