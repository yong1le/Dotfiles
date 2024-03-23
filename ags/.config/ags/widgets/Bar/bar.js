const hyprland = await Service.import("hyprland");
const mpris = await Service.import("mpris");
const audio = await Service.import("audio");
const battery = await Service.import("battery");
const systemtray = await Service.import("systemtray");
const powerprofiles = await Service.import("powerprofiles");

const date = Variable("", {
  poll: [1000, 'date "+%b %e.   %I:%M %p"'],
});

function PowerProfiles() {
  return Widget.Button({
    on_clicked: () => {
      switch (powerprofiles.active_profile) {
        case "balanced":
          powerprofiles.active_profile = "performance";
          break;
        case "performance":
          powerprofiles.active_profile = "power-saver";
          break;
        default:
          powerprofiles.active_profile = "balanced";
          break;
      }
    },
    child: Widget.Icon({
      icon_name: powerprofiles.bind("icon_name"),
      tooltip_text: powerprofiles.bind("active_profile").as((p) => `${p}`),
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

function Volume() {
  const icons = {
    101: "overamplified",
    67: "high",
    34: "medium",
    1: "low",
    0: "muted",
  };

  function getIcon() {
    const icon = audio.speaker.is_muted
      ? 0
      : [101, 67, 34, 1, 0].find(
          (threshold) => threshold <= audio.speaker.volume * 100,
        );

    return `audio-volume-${icons[icon]}-symbolic`;
  }

  function getVolume() {
    if (audio.speaker.is_muted) return "";
    return `  ${Math.round(audio.speaker.volume * 100)} %`;
  }

  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.speaker, getIcon),
  });

  const percentage = Widget.Label({
    label: Utils.watch(getVolume(), audio.speaker, getVolume),
  });

  return Widget.Button({
    class_name: "volume",
    child: Widget.Box({
      children: [icon, percentage],
    }),
  });

  // const slider = Widget.Slider({
  //   hexpand: true,
  //   draw_value: false,
  //   on_change: ({ value }) => (audio.speaker.volume = value),
  //   setup: (self) =>
  //     self.hook(audio.speaker, () => {
  //       self.value = audio.speaker.volume || 0;
  //     }),
  // });
}

function BatteryLabel() {
  const value = battery.bind("percent");
  const icon = battery.bind("icon_name");

  return Widget.Button({
    class_name: "battery",
    visible: battery.bind("available"),
    child: Widget.Box({
      children: [
        Widget.Icon({ icon }),
        Widget.Label({
          label: value.as((p) => `  ${p} %`),
          tooltip_markup: `Energy Draw: ${battery.energy_rate} W`,
        }),
      ],
    }),
  });

  // Widget.Label({
  //   label: battery.bind("energy_rate").as(p => `${p} W`)
  // }),
  // Widget.LevelBar({
  //   widthRequest: 140,
  //   vpack: "center",
  //   value: value.as((p) => (p > 0 ? p / 100 : 0))
  // }),
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
    spacing: 8,
    children: [PowerProfiles(), Volume(), BatteryLabel(), Clock()],
  });
}

export default function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
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
