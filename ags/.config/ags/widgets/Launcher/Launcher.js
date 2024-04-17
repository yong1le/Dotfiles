const LauncherWindow = (populateItems, name) => {
  // list of application buttons
  let items = populateItems();

  // container holding the buttons
  const list = Widget.Box({
    vertical: true,
    children: items,
    spacing: 12,
  });

  // repopulate the box, so the most frequent apps are on top of the list
  function repopulate() {
    items = populateItems();
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
        App.toggleWindow(name);
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
      self.hook(App, (_, windowName, visible) => {
        if (windowName !== name) return;
        // when the applauncher shows up
        if (visible) {
          repopulate();
          entry.text = "";
          entry.grab_focus();
        }
      }),
  });
};

export default function Launcher({ name, items, childSetup }) {
  return Widget.Window({
    name,
    css: `background-color: transparent`,
    setup: (self) => {
      self.keybind("Escape", () => {
        App.closeWindow(name);
      }),
        App.applyCss(`${App.configDir}/widgets/Launcher/Launcher.css`);
        childSetup(self);
    },
    visible: false,
    keymode: "exclusive",
    child: LauncherWindow(items, name),
  });
}
