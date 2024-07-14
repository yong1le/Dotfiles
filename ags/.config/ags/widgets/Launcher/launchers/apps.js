import Launcher from "./base.js";
const applications = await Service.import("applications");

/** @param {import('resource:///com/github/Aylur/ags/service/applications.js').Application} app */
const AppItem = (app, windowName) =>
  Widget.Button({
    on_clicked: () => {
      App.closeWindow(windowName);
      app.launch();
    },
    attribute: {
      /** @param {string} text */
      match: (text) => app.match(text ?? ""),
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
    windowName: "applauncher",
    reloadItems: () => {
      applications.reload();
      return applications.query("").map((app) => AppItem(app, "applauncher"));
    },
  });
}
