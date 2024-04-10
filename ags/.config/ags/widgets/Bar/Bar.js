import { LaunchButton } from "./buttons/Launch.js";
import { Title, Workspaces } from "./buttons/Workspaces.js";
import { Volume, Battery, SysTray, Mic } from "./buttons/Tray.js";
import { Clock } from "./buttons/Date.js";

function SystemTrayLabel() {
  return Widget.Box({
    class_name: "systemtray-label",
    children: [
      SysTray(),
      Mic(),
      Volume(),
      Battery(),
      Widget.Button({
        on_primary_click: () => App.ToggleWindow("controlcentre"),
        child: Widget.Icon({
          icon: "view-more-horizontal-symbolic",
        }),
      }),
    ],
  });
}

export default function Bar(monitor = 0) {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: "bar",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    setup: () => {
      App.applyCss(`${App.configDir}/widgets/Bar/Bar.css`);
    },
    child: Widget.CenterBox({
      class_name: "bar-inner",
      start_widget: Widget.Box({
        hpack: "start",
        children: [LaunchButton(), Workspaces(monitor)],
      }),
      center_widget: Widget.Box({
        hpack: "center",
        spacing: 8,
        children: [Clock()],
      }),
      end_widget: Widget.Box({
        hpack: "end",
        children: [SystemTrayLabel()],
      }),
    }),
  });
}
