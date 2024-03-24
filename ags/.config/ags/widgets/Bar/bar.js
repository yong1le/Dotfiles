const hyprland = await Service.import("hyprland");
const mpris = await Service.import("mpris");
const systemtray = await Service.import("systemtray");

import { VolumeLabel } from "../../parts/volume.js";
import { BatteryLabel } from "../../parts/power.js";
import { BacklightLabel } from "../../parts/backlight.js";

const date = Variable("", {
  poll: [1000, 'date "+%b %e.   %I:%M %p"'],
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
    on_clicked: () => App.ToggleWindow("popupcalendar"),
    class_name: "clock",
    child: Widget.Label({
      label: date.bind(),
    }),
  });
}

function Media() {
  const label = Utils.watch("", mpris, "player-changed", () => {
    if (mpris.players[0]) {
      const { track_artists, track_title } = mpris.players[0];
      return `${track_artists.join(", ")} - ${track_title}`;
    } else {
      return "Nothing is playing";
    }
  });

  return Widget.Button({
    class_name: "media",
    on_primary_click: () => mpris.getPlayer("")?.playPause(),
    on_scroll_up: () => mpris.getPlayer("")?.next(),
    on_scroll_down: () => mpris.getPlayer("")?.previous(),
    child: Widget.Label({ label }),
  });
}

function QuickSettingsLabel() {
  return Widget.Button({
    on_clicked: () => App.ToggleWindow("quicksettings"),
    on_scroll_up: () => false,
    on_scroll_down: () => false,
    child: Widget.Box({
      class_name: "quicksettings-label",
      spacing: 16,
      children: [VolumeLabel(), BacklightLabel(), BatteryLabel()],
    }),
  });
}

function SysTray() {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon"), size: 22 }),
        on_primary_click: (_, event) => item.activate(event),
        on_secondary_click: (_, event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    children: items,
  });
}

// layout of the bar
function Left() {
  return Widget.Box({
    spacing: 8,
    children: [SysTray(), Media()],
  });
}

function Right() {
  return Widget.Box({
    hpack: "end",
    spacing: 16,
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
