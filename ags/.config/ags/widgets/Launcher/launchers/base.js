// List of items returned by reloadItems must have the following attributes:
// .match() and .action()
const LauncherWindow = (reloadItems, windowName) => {
  // list of application buttons
  let items = reloadItems();

  // container holding the buttons
  const list = Widget.Box({
    vertical: true,
    children: items,
    spacing: 12,
  });

  // repopulate the box, so the most frequent apps are on top of the list
  function repopulate() {
    items = reloadItems();
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
        App.toggleWindow(windowName);
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
          if (windowName !== windowName || !visible) return;
          // when the applauncher shows up
          repopulate();
          entry.text = "";
          entry.grab_focus();
        },
        "window-toggled"
      ),
  });
};

export default function Launcher({ windowName, reloadItems }) {
  return Widget.Window({
    name: windowName,
    css: `background-color: transparent`,
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(windowName);
      });
      App.applyCss(`${App.configDir}/widgets/Launcher/Launcher.css`);
    },
    visible: false,
    keymode: "exclusive",
    child: LauncherWindow(reloadItems, windowName),
  });
}