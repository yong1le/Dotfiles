import {
  BatteryDrawLabel,
  BatteryLabel,
  BatteryRemainingLabel,
  BatterySlider,
  PowerProfilesButton,
} from "../../parts/power.js";
import { VolumeLabel, VolumeSlider } from "../../parts/volume.js";
import { BacklightLabel, BacklightSlider } from "../../parts/backlight.js";
import PopupWindow from "../../parts/popup.js";
import { MediaPlayer } from "../../parts/media.js";

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
        spacing: 32,
        children: [
          BatteryDrawLabel(),
          BatteryRemainingLabel(),
          PowerProfilesButton(),
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

function Media() {
  return Widget.Box({
    class_name: "quicksettings-media",
    children: [MediaPlayer()]
  })
}

function QuickSettingsInner() {
  return Widget.Box({
    spacing: 32,
    class_names: ["quicksettings", "popup-inner"],
    vertical: true,
    children: [Volume(), Backlight(), Battery(), Media()],
  });
}

export default function QuickSettings() {
  return PopupWindow({
    name: "quicksettings",
    anchor: ["top", "right"],
    child: QuickSettingsInner(),
  });
}
