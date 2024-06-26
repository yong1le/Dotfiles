import { secondsToTime } from "../../../utils/utils.js";

const battery = await Service.import("battery");
const powerprofiles = await Service.import("powerprofiles");

function BatteryPercentage() {
  const value = battery.bind("percent");
  const icon = battery.bind("icon_name");

  return Widget.Box({
    visible: battery.bind("available"),
    spacing: 8,
    children: [
      Widget.Icon({
        icon,
      }),
      Widget.Label({
        label: value.as((p) => `${p} %`),
      }),
    ],
  });
}

function BatteryDraw() {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Icon({
        icon: battery
          .bind("charging")
          .as((p) => (p ? "go-up-symbolic" : "go-down-symbolic")),
      }),
      Widget.Label({
        visible: battery.bind("available"),
        label: battery.bind("energy_rate").as((p) => `${p} W`),
      }),
    ],
  });
}

function BatteryRemaining() {
  return Widget.Box({
    spacing: 8,
    children: [
      Widget.Icon({
        icon: "preferences-system-time-symbolic",
      }),
      Widget.Label({
        visible: battery.bind("available"),
        label: battery.bind("time_remaining").as((p) => `${secondsToTime(p)}`),
      }),
    ],
  });
}

export const Battery = () => {
  return Widget.Box({
    class_name: "battery-info",
    hexpand: true,
    spacing: 8,
    vertical: true,
    children: [BatteryPercentage(), BatteryDraw(), BatteryRemaining()],
  });
};

export const PowerProfiles = () => {
  const icon = powerprofiles.bind("icon_name");
  const profile = powerprofiles.bind("active_profile").as((p) => `${p}`);


  return Widget.Button({
    class_name: "control-button",
    on_clicked: switchPPD,
    hexpand: true,
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Icon({
          icon,
        }),
        Widget.Label({
          label: profile,
        }),
      ],
    }),
  });
};
