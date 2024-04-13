const network = await Service.import("network");
const bluetooth = await Service.import("bluetooth");

export const Wifi = () => {
  const wifiLabel = Utils.merge(
    [network.wifi.bind("ssid"), network.wifi.bind("enabled")],
    (ssid, enabled) => {
      if (!enabled) return "Disabled";

      return ssid || "Unknown";
    },
  );

  return Widget.Button({
    on_primary_click: () => network.toggleWifi(),
    class_names: ["control-button"],
    setup: (self) =>
      self.hook(network.wifi, () => {
        self.toggleClassName("active", network.wifi.enabled);
      }),
    child: Widget.Box({
      spacing: 8,
      hexpand: true,
      children: [
        Widget.Icon({
          icon: network.wifi.bind("icon_name"),
        }),
        Widget.Label({
          label: wifiLabel,
        }),
      ],
    }),
  });
};

export const Bluetooh = () => {
  const bluetoothLabel = Utils.merge(
    [bluetooth.bind("enabled"), bluetooth.bind("connected_devices")],
    (on, connected) => {
      if (!on) return "Disabled";
      if (!connected || connected.length === 0) return "Active";
      return `${connected[0].name}`;
    },
  );

  return Widget.Button({
    on_primary_click: () => bluetooth.toggle(),
    on_secondary_click: () => Utils.subprocess("blueman-manager", () => {}),
    class_names: ["control-button"],
    setup: (self) =>
      self.hook(bluetooth, () => {
        self.toggleClassName("active", bluetooth.enabled);
      }),
    child: Widget.Box({
      hexpand: true,
      spacing: 8,
      children: [
        Widget.Icon({
          icon: bluetooth
            .bind("enabled")
            .as((on) => `bluetooth-${on ? "active" : "disabled"}-symbolic`),
        }),
        Widget.Label({
          label: bluetoothLabel,
        }),
      ],
    }),
  });
};
