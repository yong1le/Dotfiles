const hyprland = await Service.import("hyprland");

import { VolumeLabel } from "../../parts/volume.js";
import { BatteryLabel } from "../../parts/power.js";
import { BacklightLabel } from "../../parts/backlight.js";
import { SysTray } from "../../parts/systray.js";

function LauncherLabel() {
  return Widget.Button({
    on_primary_click: () =>
      Utils.subprocess(["wofi", "--show", "drun"], () => {}),
    on_secondary_click: () => Utils.subprocess(["killall", "wofi"], () => {}),
    child: Widget.Icon({
      class_name: "icon",
      icon: "deepin-launcher",
    }),
  });
}

/**
 * @param {number} monitor
 */
function Workspaces(monitor) {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws
      .filter((e) => e.monitorID === monitor && e.id > 0)
      .sort((a, b) => a.id - b.id)
      .map((e) =>
        Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${e.id}`),
          child: Widget.Label(e.id == e.name ? `${e.id}`: `${e.id} ${e.name}`),
          class_name: activeId.as((i) => `${i === e.id ? "focused" : ""}`),
        }),
      ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}

function Clock() {
  const date = Variable("", {
    poll: [1000, 'date "+%A, %b.%e, %I:%M %p"'],
  });

  return Widget.Button({
    on_clicked: () => {
      App.ToggleWindow("fullscreenclose");
      App.ToggleWindow("popupcalendar");
    },
    class_name: "clock",
    child: Widget.Label({
      label: date.bind(),
    }),
  });
}

function SystemTrayLabel() {
  return Widget.Box({
    class_name: "systemtray-label",
    children: [SysTray()],
  });
}

function QuickSettingsLabel() {
  return Widget.Button({
    class_name: "quicksettings-label",
    on_clicked: () => {
      App.ToggleWindow("fullscreenclose");
      App.ToggleWindow("quicksettings");
    },
    on_scroll_up: () => false,
    on_scroll_down: () => false,
    child: Widget.Box({
      spacing: 16,
      children: [VolumeLabel(), BacklightLabel(), BatteryLabel()],
    }),
  });
}

function Left(monitor) {
  return Widget.Box({
    hpack: "start",
    children: [LauncherLabel(), Workspaces(monitor)],
  });
}

// layout of the bar
function Center(monitor) {
  return Widget.Box({
    spacing: 8,
    children: [Clock()],
  });
}

function Right(monitor) {
  return Widget.Box({
    hpack: "end",
    children: [QuickSettingsLabel(), SystemTrayLabel()],
  });
}

export default function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      center_widget: Center(monitor),
      start_widget: Left(monitor),
      end_widget: Right(monitor),
    }),
  });
}
