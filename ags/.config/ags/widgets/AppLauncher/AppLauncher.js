const applications = await Service.import("applications");
const WINDOW_NAME = "applauncher";

/** @param {import('resource:///com/github/Aylur/ags/service/applications.js').Application} app */
const AppItem = (app) =>
  Widget.Button({
    on_clicked: () => {
      App.closeWindow(WINDOW_NAME);
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

const LauncherWindow = () => {
  // list of application buttons
  let items = applications.query("").map(AppItem);

  // container holding the buttons
  const list = Widget.Box({
    vertical: true,
    children: items,
    spacing: 12,
  });

  // repopulate the box, so the most frequent apps are on top of the list
  function repopulate() {
    applications.reload();
    items = applications.query("").map(AppItem);
    list.children = items;
  }

  // search entry
  const entry = Widget.Entry({
    hexpand: true,
    // to launch the first item on Enter
    on_accept: () => {
      // make sure we only consider visible (searched for) applications
      const results = items.filter((item) => item.visible);
      if (results[0]) {
        App.toggleWindow(WINDOW_NAME);
        results[0].attribute.action();
      }
    },

    // filter out the list
    on_change: ({ text }) =>
      items.forEach((item) => {
        item.visible = item.attribute.match(text);
      }),
  });

  return Widget.Box({
    vertical: true,
    class_name: "launcher-container",
    spacing: 16,
    children: [
      entry,
      Widget.Scrollable({
        hscroll: "never",
        vexpand: true,
        child: list,
      }),
    ],
    setup: (self) =>
      self.hook(
        App,
        (_, windowName, visible) => {
          if (windowName !== WINDOW_NAME || !visible) return;
          // when the applauncher shows up
          repopulate();
          entry.text = "";
          entry.grab_focus();
        },
        "window-toggled",
      ),
  });
};

export default function AppLauncher() {
  return Widget.Window({
    name: WINDOW_NAME,
    css: `background-color: transparent`,
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(WINDOW_NAME);
      });
      App.applyCss(`${App.configDir}/widgets/AppLauncher/AppLauncher.css`);
    },
    visible: false,
    keymode: "exclusive",
    child: LauncherWindow(),
  });
}
