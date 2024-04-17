import Launcher from "../Launcher/Launcher.js";

const { query } = await Service.import("applications");
const WINDOW_NAME = "applauncher";

/** @param {import('resource:///com/github/Aylur/ags/service/applications.js').Application} app */
const AppItem = (app) =>
  Widget.Button({
    on_clicked: () => {
      App.closeWindow(WINDOW_NAME);
      app.launch();
    },
    attribute: {
      match: (text) => app.name.match(text ?? ""),
      action: app.launch,
    },
    child: Widget.Box({
      spacing: 8,
      children: [
        Widget.Icon({
          icon: app.icon_name || "",
        }),
        Widget.Label({
          class_name: "title",
          label: app.name,
          xalign: 0,
          vpack: "center",
          truncate: "end",
        }),
      ],
    }),
  });

export default function AppLauncher() {
  return Launcher({
    name: WINDOW_NAME,
    items: () => query("").map(AppItem),
    childSetup: () => {},
  });
}
