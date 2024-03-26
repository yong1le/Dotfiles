const hyprland = await Service.import("hyprland");

import { VolumeLabel } from "../../parts/volume.js";
import { BatteryLabel } from "../../parts/power.js";
import { BacklightLabel } from "../../parts/backlight.js";
import { SysTray } from "../../parts/systray.js";

const date = Variable("", {
  poll: [1000, 'date "+%A, %b. %e, %I:%M %p"'],
});

/**
 * @param {number} monitor
 */
function Workspaces(monitor) {
  const activeId = hyprland.active.workspace.bind("id");
  const workspaces = hyprland.bind("workspaces").as((ws) =>
    ws
      .filter((e) => e.monitorID === monitor)
      .sort((a, b) => a.id - b.id)
      .map(({ id }) =>
        Widget.Button({
          on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
          child: Widget.Label(`${id}`),
          class_name: activeId.as((i) => `${i === id ? "focused" : ""}`),
        }),
      ),
  );

  return Widget.Box({
    class_name: "workspaces",
    children: workspaces,
  });
}

function Clock() {
  return Widget.Button({
    on_clicked: () => {
      App.ToggleWindow("fullscreenclose")
      App.ToggleWindow("popupcalendar")
    },
    class_name: "clock",
    child: Widget.Label({
      label: date.bind(),
    }),
  });
}

function SystemTrayLabel() {
  const mediaButton = Widget.Button({
    on_primary_click: () => {
      App.ToggleWindow("mediaplayer")
      App.ToggleWindow("fullscreenclose")
    }
    ,
    child: Widget.Icon({
      icon: "media-playback-start-symbolic",
    }),
  });

  return Widget.Box({
    class_name: "systemtray-label",
    children: [SysTray(), mediaButton],
  });
}

function QuickSettingsLabel() {
  return Widget.Button({
    class_name: "quicksettings-label",
    on_clicked: () => {
      App.ToggleWindow("fullscreenclose")
      App.ToggleWindow("quicksettings")
    },
    on_scroll_up: () => false,
    on_scroll_down: () => false,
    child: Widget.Box({
      spacing: 16,
      children: [VolumeLabel(), BacklightLabel(), BatteryLabel()],
    }),
  });
}

// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [SystemTrayLabel()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    children: [QuickSettingsLabel(), Clock()],
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
      start_widget: Left(),
      center_widget: Workspaces(monitor),
      end_widget: Right(),
    }),
  });
}
