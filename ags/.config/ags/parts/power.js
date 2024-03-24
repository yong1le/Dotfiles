const battery = await Service.import("battery");
const powerprofiles = await Service.import("powerprofiles");

/**
 * @param {number} seconds
 */
function secondsToTime(seconds) {
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);

  // Formatting: add leading zero if single digit
  const hoursStr = hours < 10 ? "0" + hours : hours;
  const minutesStr = minutes < 10 ? "0" + minutes : minutes;

  return `${hoursStr} : ${minutesStr}`;
}

export const BatteryLabel = () => {
  const value = battery.bind("percent");
  const icon = battery.bind("icon_name");

  return Widget.Box({
    class_name: "battery-label",
    visible: battery.bind("available"),
    spacing: 8,
    children: [
      Widget.Icon({ icon, size:18 }),
      Widget.Label({
        label: value.as((p) => `${p} %`),
      }),
    ],
  });
};

export const BatterySlider = () => {
  const value = battery.bind("percent");

  return Widget.LevelBar({
    class_name: "battery-slider",
    hexpand: true,
    vpack: "center",
    value: value.as((p) => (p > 0 ? p / 100 : 0)),
  });
};

export const BatteryDrawLabel = () => {
  return Widget.Label({
    class_name: "battery-draw",
    label: battery.bind("energy_rate").as((p) => `Draw: ${p} W`),
  });
};

export const BatteryRemainingLabel = () => {
  return Widget.Label({
    class_name: "battery-remaining",
    label: battery.bind("time_remaining").as((p) => `Remaining: ${secondsToTime(p)}`),
  });
};

export const PowerProfilesButton = () => {
  const icon = powerprofiles.bind("icon_name");
  const profile = powerprofiles.bind("active_profile").as((p) => `${p}`);

  const switchProfile = () => {
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
  };

  return Widget.Button({
    class_name: "battery-profiles",
    on_clicked: switchProfile,
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Icon({
          icon, size: 18
        }),
        Widget.Label({
          label: profile,
        }),
      ],
    }),
  });
};
