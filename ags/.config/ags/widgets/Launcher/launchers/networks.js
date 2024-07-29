import Launcher from "./base.js";
const network = await Service.import("network");

const NetworkItem = (item, windowName) => {
  const action = () => {
    Utils.execAsync([
      "bash",
      "-c",
      `~/.config/hypr/scripts/connect-wifi "${item.ssid}"`,
    ]);
  };
  return Widget.Button({
    on_clicked: () => {
      App.closeWindow(windowName);
      action();
    },
    attribute: {
      /** @param {string} text */
      match: (text) => item.ssid.toLowerCase().match(text.toLowerCase() ?? ""),
      action,
    },
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Label({
          class_name: "title",
          label: item.ssid,
          xalign: 0,
          vpack: "center",
          truncate: "end",
        }),
      ],
    }),
  });
};

export default function NetworkLauncher() {
  return Launcher({
    windowName: "networklauncher",
    reloadItems: () => {
      network.wifi.scan();
      const ids = new Set();
      const networks = network.wifi.access_points.filter((item) => {
        if (item.ssid === "Unknown") return false;
        if (!ids.has(item.ssid)) {
          ids.add(item.ssid);
          return true;
        }
        return false;
      });
      return networks.map((item) => NetworkItem(item, "networklauncher"));
    },
  });
}
